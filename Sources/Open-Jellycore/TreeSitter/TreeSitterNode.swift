//
//  TreeSitterNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import TreeSitter
import Foundation

final class TreeSitterNode {
    let rawNode: TSNode
    
    var type: String? {
        if let strPtr = ts_node_type(rawNode) {
            return String(cString: strPtr)
        }
        return nil
    }
    
    var string: String? {
        if let strPtr = ts_node_string(rawNode) {
            return String(cString: strPtr)
        }
        return nil
    }
    
    var startByte: Int {
        return Int(ts_node_start_byte(rawNode))
    }

    var endByte: Int {
        return Int(ts_node_end_byte(rawNode))
    }

    var isNull: Bool {
        ts_node_is_null(rawNode)
    }
    
    var isNamed: Bool {
        ts_node_is_named(rawNode)
    }
    
    var isMissing: Bool {
        ts_node_is_missing(rawNode)
    }
    
    var isExra: Bool {
        ts_node_is_extra(rawNode)
    }
    
    var hasChanges: Bool {
        ts_node_has_changes(rawNode)
    }
    
    var hasError: Bool {
        ts_node_has_error(rawNode)
    }

    var parent: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_parent(rawNode))
    }
    
    var nextSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_next_sibling(rawNode))
    }

    var prevSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_prev_sibling(rawNode))
    }
    
    var nextNamedSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_next_named_sibling(rawNode))
    }

    var prevNamedSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_prev_named_sibling(rawNode))
    }
    
    var numberOfChildren: Int {
        Int(ts_node_child_count(rawNode))
    }
    
    var numberOfNamedChildren: Int {
        Int(ts_node_named_child_count(rawNode))
    }

    init(rawNode: TSNode) {
        self.rawNode = rawNode
    }
    
    func getChild(index: Int) -> TreeSitterNode? {
        let possibleChild = ts_node_child(rawNode, UInt32(index))
        return TreeSitterNode.getPossibleNode(node: possibleChild)
    }
    
    func getChildren() -> [TreeSitterNode] {
        if numberOfChildren == 0 { return [] }
        var children: [TreeSitterNode] = []
        
        for index in 0 ..< numberOfChildren {
            if let child = self.getChild(index: index) {
                children.append(child)
            } else {
                print("Unable to get child at \(index)")
            }
        }
        
        return children
    }
    
    func getNamedChild(index: Int) -> TreeSitterNode? {
        let possibleChild = ts_node_named_child(rawNode, UInt32(index))
        return TreeSitterNode.getPossibleNode(node: possibleChild)
    }
    
    func getNamedChildren() -> [TreeSitterNode] {
        if numberOfChildren == 0 { return [] }
        var children: [TreeSitterNode] = []
        
        for index in 0 ..< numberOfNamedChildren {
            if let child = self.getNamedChild(index: index) {
                children.append(child)
            } else {
                print("Unable to get named child at \(index)")
            }
        }
        
        return children
    }
    
    func getFieldNameForChild(index: Int) -> String? {
        if let strPtr = ts_node_field_name_for_child(rawNode, UInt32(index)) {
            return String(cString: strPtr)
        }
        return nil
    }
    
    func getChild(by field: String) -> TreeSitterNode? {
        let possibleChild = ts_node_child_by_field_name(rawNode, field, UInt32(field.count))
        return TreeSitterNode.getPossibleNode(node: possibleChild)
    }
    
    func getContents(in str: String) -> String {
        let start = str.index(str.startIndex, offsetBy: startByte)
        let end = str.index(str.startIndex, offsetBy: endByte)
        
        return String(str[start ..< end])
    }
}

extension TreeSitterNode {
    static func getPossibleNode(node: TSNode) -> TreeSitterNode? {
        let node = TreeSitterNode(rawNode: node)
        return node.isNull ? nil : node
    }
}

extension TreeSitterNode: Equatable {
    static func == (lhs: TreeSitterNode, rhs: TreeSitterNode) -> Bool {
        return ts_node_eq(lhs.rawNode, rhs.rawNode)
    }
}
