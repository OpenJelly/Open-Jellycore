//
//  MagicVariableNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

/// A node that represents a magic variable definition.
final class MagicVariableNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var identifier: IdentifierNode?
    
    /// Initializes a Magic Variable  node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .import
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let identifierResults = getIdentifier() {
            identifier = IdentifierNode(sString: identifierResults.node.string ?? "No sString", content: identifierResults.content, rawValue: identifierResults.node)
        }
    }
    
    /// Get's the identifier of the magic variable. This is equivalent to the name the user wishes to assign to the magic variable.
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String). Returns nil if the name child is not found.
    func getIdentifier() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "name") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}
