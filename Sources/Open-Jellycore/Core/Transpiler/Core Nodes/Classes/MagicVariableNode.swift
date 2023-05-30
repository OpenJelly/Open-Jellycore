//
//  MagicVariableNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

final class MagicVariableNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var identifier: IdentifierNode?
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .import
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let identifierResults = getIdentifier() {
            identifier = IdentifierNode(sString: identifierResults.node.string ?? "No sString", content: identifierResults.content, rawValue: identifierResults.node)
        }
    }
    
    func getIdentifier() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "name") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}
