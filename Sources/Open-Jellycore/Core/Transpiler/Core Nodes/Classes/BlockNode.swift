//
//  BlockNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/29/23.
//

final class BlockNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .block
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
}
