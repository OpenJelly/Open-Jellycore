//
//  ConditionalNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

/// A node that represents a shortcuts conditional statements. Contains both the if statement and a reference to a possible else statement.
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
    
    var magicVariable: MagicVariableNode?

    /// Initializes a Conditional node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
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
            self.secondaryNode = PrimitiveFactory.derivePrimitive(node: secondaryResults.node, content: secondaryResults.content)
        }
        
        if let bodyResults = getBodyNode() {
            self.body = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
        }
        
        if let elseResults = getElseNode() {
            self.elseNode = ConditionalElseNode(sString: elseResults.node.string ?? "No sString", content: elseResults.content, rawValue: elseResults.node)
        }
        
        collectMagicVariable()
    }
    
    /// Retrieves the body of the conditional statement
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String). Node is the node that represents the body of the conditional statement. And contents is the string contents of that node.
    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Returns the primary conditional node. This node is often the main condition we are checking against.
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String).
    func getPrimaryNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "primary") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Returns the operator being used in the conditional.. If the user is using boolean conditional this will return nill
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String)
    func getOperatorNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "operator") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Returns the secondary node that we are checking against.
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String)
    func getSecondaryNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "secondary") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Returns the possible else node that follows a conditional statement.
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String)
    func getElseNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "else") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Collects the magic variable that can appear at the end of an if statement.
    func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}

/// A node that represents a conditional else statement. Should not be initialized by itself, these are initialized by a `ConditionalNode` when it retrieves it's else statement.
final class ConditionalElseNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var body: BlockNode?
    
    var magicVariable: MagicVariableNode?
    
    /// Initializes a Conditional Else node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .conditional
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let bodyResults = getBodyNode() {
            let blockNode = BlockNode(sString: bodyResults.node.string ?? "No sString", content: bodyResults.content, rawValue: bodyResults.node)
            self.body = blockNode
        }
        
        collectMagicVariable()
    }
 
    /// Retrieves the body of the conditional statement
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String). Node is the node that represents the body of the conditional statement. And contents is the string contents of that node.
    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Collects the magic variable that can appear at the end of an if statement.
    func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}

/// A node that represents a conditional statement's operator node.
final class OperatorNode: CoreNode {
    /// An enumeration that represents all of the available operator types
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
        
        /// A description for the operator type
        var description: String {
            rawValue
        }
        
        /// The equivalent shortcuts condition number. This is used when the condition is compiled into a shortcut action.
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
    
    /// Initializes an Operator  node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
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
