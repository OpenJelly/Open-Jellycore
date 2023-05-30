//
//  ConditionalNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

final class ConditionalNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var primaryNode: IdentifierNode?
    var operatorNode: OperatorNode?
    var secondaryNode: CorePrimitiveNode?
    
    var body: BlockNode?
    var elseNode: ConditionalElseNode?
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .conditional
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let primaryResults = getPrimaryNode() {
            self.primaryNode = IdentifierNode(sString: primaryResults.node.string ?? "No sString", content: primaryResults.content, rawValue: primaryResults.node)
        }
        
        if let operatorResults = getOperatorNode(),
           let operatorNode = OperatorNode(sString: operatorResults.node.string ?? "No sString", content: operatorResults.content, rawValue: operatorResults.node) {
            self.operatorNode = operatorNode
        }
        
        if let secondaryResults = getSecondaryNode() {
            let primitive = PrimitiveFactory.derivePrimitive(node: secondaryResults.node, content: secondaryResults.content)
            self.secondaryNode = primitive
        }
        
        if let bodyResults = getBodyNode() {
            let blockNode = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
            self.body = blockNode
        }
        
        if let elseResults = getElseNode() {
            let conditionalElseNode = ConditionalElseNode(sString: elseResults.node.string ?? "No sString", content: elseResults.content, rawValue: elseResults.node)
            self.elseNode = conditionalElseNode
        }
    }
 
    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    func getPrimaryNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "primary") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    func getOperatorNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "operator") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    func getSecondaryNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "secondary") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    func getElseNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "else") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}

final class ConditionalElseNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var body: BlockNode?
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .conditional
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let bodyResults = getBodyNode() {
            let blockNode = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
            self.body = blockNode
        }
    }
 
    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}

final class OperatorNode: CoreNode {
    enum OperatorType: String, CustomStringConvertible {
        case and = "&&"
        case or = "||"
        
        case equals = "=="
        case notEquals = "!="
        
        case lessThan = "<"
        case lessThanEquals = "<="
        
        case greaterThan = ">"
        case greaterThanEquals = ">="
        
        case singleBoolean = ":)"
        
        case contains = "::"
        case notContains = "!:"
        
        case beginsWith = "$$"
        case endsWith = "$!"
        
        var description: String {
            rawValue
        }
        
        var shortcutsConditionNumber: Int {
            switch self {
            case .and:
                return 0
            case .or:
                return 0
            case .equals:
                return 4
            case .notEquals:
                return 5
            case .lessThan:
                return 0
            case .lessThanEquals:
                return 1
            case .greaterThan:
                return 2
            case .greaterThanEquals:
                return 3
            case .singleBoolean:
                return 4
            case .contains:
                return 99
            case .notContains:
                return 999
            case .beginsWith:
                return 8
            case .endsWith:
                return 9
            }
        }
    }
    
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var operatorType: OperatorType
    
    init?(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .operator
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let type = OperatorType(rawValue: content) {
            self.operatorType = type
        } else {
            return nil
        }
    }
}
