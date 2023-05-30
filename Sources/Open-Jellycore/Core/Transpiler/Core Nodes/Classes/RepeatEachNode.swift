//
//  RepeatEachNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

final class RepeatEachNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var identifier: IdentifierNode?
    
    var body: BlockNode?
    
    var magicVariable: MagicVariableNode?

    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .repeatEach
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let identifierResults = getIdentifierNode() {
            self.identifier = IdentifierNode(sString: identifierResults.node.string ?? "No sString", content: identifierResults.content, rawValue: identifierResults.node)
        }
        
        if let bodyResults = getBodyNode() {
            self.body = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
        }
        
        collectMagicVariable()
    }
 
    func getIdentifierNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "variable") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }

    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}
