//
//  RepeatEachNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

/// A node that represents shortcuts Repeat Each control flow action.
final class RepeatEachNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var identifier: IdentifierNode?
    
    var body: BlockNode?
    
    var magicVariable: MagicVariableNode?

    /// Initializes a Repeat Each node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
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
 
    /// Retrieves the identifier for the repeat control flow. This identifier is what the repeat will loop over.
    /// - Returns: An optional tuple of node (TreeSitterNode) and content (String) that provide access to the identifier node.
    private func getIdentifierNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "variable") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }

    /// Retrieves the body of the conditional statement
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String). Node is the node that represents the body of the conditional statement. And contents is the string contents of that node.
    private func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    /// Collects the magic variable that can appear at the end of an if statement.
    private func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}
