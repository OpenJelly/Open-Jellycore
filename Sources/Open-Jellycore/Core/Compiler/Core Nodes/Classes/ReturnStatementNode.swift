//
//  ReturnStatementNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/17/23.
//

import Foundation

/// A core node class that represents a return statement.
final class ReturnStatementNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var valuePrimitive: CorePrimitiveNode?

    /// Initializes a Flag node.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .returnStatement
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let valueResults = getReturnValue() {
            valuePrimitive = PrimitiveFactory.derivePrimitive(node: valueResults.node, content: valueResults.content)
        }
    }
    
    
    /// Retrieves the identifier for the repeat control flow. This identifier is what the repeat will loop over.
    /// - Returns: An optional tuple of node (TreeSitterNode) and content (String) that provide access to the identifier node.
    private func getReturnValue() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "value") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}
