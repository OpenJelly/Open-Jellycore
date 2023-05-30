//
//  RepeatNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

final class RepeatNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var amount: NumberNode?
    
    var body: BlockNode?
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .repeat
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let amountResults = getAmountNode() {
            amount = NumberNode(sString: amountResults.node.string ?? "No sString", content: amountResults.content, rawValue: amountResults.node)
        }
        
        if let bodyResults = getBodyNode() {
            self.body = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
        }
    }
 
    func getAmountNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "amount") {
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
}
