//
//  MenuNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

/// A node that represents a shortcuts Menu.
final class MenuNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode

    var prompt: StringNode?
    var body: MenuBlockNode?
    
    var magicVariable: MagicVariableNode?

    /// Initializes a Menu node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
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
        
        collectMagicVariable()
    }
    
    /// Retrieves the prompt for the menu. This is the question which is posed to the user in shortcuts.
    /// - Returns: An optional tuple contains a node (TreeSitterNode) and content (String). This returns nil if there is no prompt.
    func getPrompt() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "prompt") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Retrieves the body of the menu node.
    /// - Returns: An optional tuple contains a node (TreeSitterNode) and content (String). This returns nil if there is no body.
    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Collects the possible magic variable at the end of a menu statement.
    func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}

/// A menu block node represents the block of code that is contained within a menu.
final class MenuBlockNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var caseNodes: [MenuCaseNode] = []
    
    /// Initializes a Menu Block node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
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
    
    /// Retrieves all of the cases present within the block.
    /// - Returns: The list of TreeSitterNodes which have the type of `menu_case`.
    func getMenuCases() -> [TreeSitterNode] {
        return rawValue.getNamedChildren().filter({ $0.type == CoreNodeType.menuCase.rawValue })
    }
}

/// Represents an individual menu case inside of a `MenuBlockNode`.
final class MenuCaseNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
        
    var caseString: StringNode?
    var body: BlockNode?

    /// Initializes a Menu Case node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
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
    
    /// Get's the case that this case presents to the user. Shortcuts displays this as one of the options the user can select.
    /// - Returns: An optional tuple contains a node (TreeSitterNode) and content (String). This returns nil if there is no body.
    func getCase() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "case") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Returns all of a body node that contains all of the statements that the case node has underneath it.
    /// - Returns: An optional tuple contains a node (TreeSitterNode) and content (String). This returns nil if there is no body.
    func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}
