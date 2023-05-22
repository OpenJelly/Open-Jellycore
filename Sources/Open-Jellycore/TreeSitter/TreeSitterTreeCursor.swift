//
//  TreeSitterTreeCursor.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import TreeSitter

class TreeSitterTreeCursor {
    let rawValue: TSTreeCursor
    
    init(rawValue: TSTreeCursor) {
        self.rawValue = rawValue
    }
}
