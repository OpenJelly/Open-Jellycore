//
//  CommentNode.swift
//  Opem-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

final class CommentNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    /// Initializes a Comment node.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .comment
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    /// Retrieves a comments content by getting the contents of the child labeled 'content'
    /// - Returns: If the child labeled 'content' is present this will return the contents of the comment. Otherwise it returns nil.
    func getContent() -> String? {
        if let idNode = rawValue.getChild(by: "content") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
}
