//
//  BlockNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

/// A node that represents a block of Jelly code
final class BlockNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    /// Initializes a Block node.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .block
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
}
