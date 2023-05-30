//
//  MenuNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

final class MenuNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode

    var prompt: StringNode?
    var body: MenuBlockNode?
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .menu
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let promptResults = getPrompt() {
            self.prompt = StringNode(sString: promptResults.node.string ?? "No sString", content: promptResults.content, rawValue: promptResults.node)
        }
        
        if let bodyResults = getBodyNode() {
            self.body = MenuBlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
        }
    }
 
    func getPrompt() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "prompt") {
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

final class MenuBlockNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var caseNodes: [MenuCaseNode] = []
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .menuBlock
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        caseNodes = getMenuCases().compactMap({ node in
            let content = rawValue.getContents(of: node, in: content)
            return MenuCaseNode(sString: node.string ?? "No sString", content: content, rawValue: node)
        })
    }
    
    func getMenuCases() -> [TreeSitterNode] {
        return rawValue.getNamedChildren().filter({ $0.type == CoreNodeType.menuCase.rawValue })
    }
}

final class MenuCaseNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
        
    var caseString: StringNode?
    var body: BlockNode?

    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .menuCase
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let caseResults = getCase() {
            self.caseString = StringNode(sString: caseResults.node.string ?? "No sString", content: caseResults.content, rawValue: caseResults.node)
        }

        if let bodyResults = getBodyNode() {
            self.body = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
        }
    }
    
    func getCase() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "case") {
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
