//
//  FunctionDefinitionNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/2/23.
//

final class FunctionDefinitionNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    var name: String = "unnamed"

    var parameters: [FunctionCallParameterItem] = []
    var body: BlockNode?

    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .flag
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let name = getName() {
            self.name = name
        }
        
        if let bodyResults = getBodyNode() {
            self.body = BlockNode(sString: bodyResults.node.string ?? "(empty)", content: bodyResults.content, rawValue: bodyResults.node)
        }

        collectParameters()
    }
    
    private func getName() -> String? {
        if let node = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: node, in: content)
        }
        return nil
    }
    
    private func collectParameters() {
        if let parameterListNode = rawValue.getChild(by: "parameters") {
            for child in parameterListNode.getNamedChildren() {
                if child.type == CoreNodeType.parameterListItem.rawValue {
                    let sString = child.string ?? "(empty)"
                    let content = rawValue.getContents(of: child, in: content)

                    parameters.append(FunctionCallParameterItem(sString: sString, content: content, rawValue: child))
                }
            }
        } else {
            print("Unable to get parameters")
        }
    }

    private func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}
