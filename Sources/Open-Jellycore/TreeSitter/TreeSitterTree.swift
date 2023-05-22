//
//  TreeSitterTree.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import TreeSitter

final class TreeSitterTree {
    let rawTreePtr: OpaquePointer?
    
    init(rawTreePtr: OpaquePointer?) throws {
        guard let rawTreePtr else {
            throw JellycoreTreeSitterError.invalidPointer(type: "TreeSitterTree")
        }
        self.rawTreePtr = rawTreePtr
    }
    
    deinit {
        ts_tree_delete(rawTreePtr)
    }
    
    func rootNode() -> TreeSitterNode {
        let node = ts_tree_root_node(rawTreePtr)
        return TreeSitterNode(rawNode: node)
    }
    
    func copy() -> OpaquePointer? {
        return ts_tree_copy(rawTreePtr)
    }
}

