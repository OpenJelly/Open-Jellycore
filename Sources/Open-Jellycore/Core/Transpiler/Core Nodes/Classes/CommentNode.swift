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
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .comment
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    func getContent() -> String? {
        if let idNode = rawValue.getChild(by: "content") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
}
