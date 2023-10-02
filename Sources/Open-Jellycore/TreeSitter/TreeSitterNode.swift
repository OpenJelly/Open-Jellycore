//
//  TreeSitterNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import TreeSitter
import Foundation

/// A class that wraps the underlying `TSNode` C structure provided by `TreeSitter`
final class TreeSitterNode {
    /// The raw node C node that this node wraps.
    let rawNode: TSNode
    
    /// The type of the node, if one exists.
    var type: String? {
        if let strPtr = ts_node_type(rawNode) {
            return String(cString: strPtr)
        }
        return nil
    }
    
    /// The debug string of the node, if one exists.
    var string: String? {
        if let strPtr = ts_node_string(rawNode) {
            return String(cString: strPtr)
        }
        return nil
    }
    
    /// The start byte of the node in the content parsed.
    var startByte: Int {
        return Int(ts_node_start_byte(rawNode))
    }
    
    /// The end byte of the node in the content parsed.
    var endByte: Int {
        return Int(ts_node_end_byte(rawNode))
    }
    
    /// The start position of the node in the content parsed.
    var startPoint: TSPoint {
        return ts_node_start_point(rawNode)
    }
    
    /// The end position of the node in the content parsed.
    var endPoint: TSPoint {
        return ts_node_end_point(rawNode)
    }

    /// Returns true if the `TSNode` is a NULL node. This means that the node was not properly parsed.
    var isNull: Bool {
        ts_node_is_null(rawNode)
    }
    
    /// Returns true if the `TSNode` is named.
    var isNamed: Bool {
        ts_node_is_named(rawNode)
    }
    
    /// Returns true if the `TSNode` is a missing node inserted by `TreeSitter` to recover from parsing errors.
    var isMissing: Bool {
        ts_node_is_missing(rawNode)
    }
    
    /// Returns true if the `TSNode` is an extra node such as a comment.
    var isExra: Bool {
        ts_node_is_extra(rawNode)
    }
    
    /// Returns true if the node has changes in the tree.
    var hasChanges: Bool {
        ts_node_has_changes(rawNode)
    }
    
    /// Returns true if somewhere in the node, an error is present.
    var hasError: Bool {
        ts_node_has_error(rawNode)
    }
    
    /// If the node has a parent, that node is returned.
    var parent: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_parent(rawNode))
    }
    
    /// If the node has a next sibling, that node is returned
    var nextSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_next_sibling(rawNode))
    }
    
    /// If the node has a previous sibling, that node is returned
    var prevSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_prev_sibling(rawNode))
    }
    
    /// If the node has a next sibling that is named, that node is returned
    var nextNamedSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_next_named_sibling(rawNode))
    }
    
    /// If the node has a previous sibling that is named, that node is returned
    var prevNamedSibling: TreeSitterNode? {
        TreeSitterNode.getPossibleNode(node: ts_node_prev_named_sibling(rawNode))
    }
    
    /// Returns the number of children that the node has.
    var numberOfChildren: Int {
        Int(ts_node_child_count(rawNode))
    }
    
    /// Returns the number of named children that the node has.
    var numberOfNamedChildren: Int {
        Int(ts_node_named_child_count(rawNode))
    }
    
    /// Initializes the node from a raw `TSNode`
    /// - Parameter rawNode: The raw `TSNode` that this class will wrap.
    init(rawNode: TSNode) {
        self.rawNode = rawNode
    }
    
    /// Retrieves the child at the given index from the list of children.
    /// - Parameter index: the index to retrieve the child at
    /// - Returns: If there is a child at the provided index, that child is returned.
    func getChild(index: Int) -> TreeSitterNode? {
        let possibleChild = ts_node_child(rawNode, UInt32(index))
        return TreeSitterNode.getPossibleNode(node: possibleChild)
    }
    
    /// Retrieves a list of all of the children converted to their own `TreeSitterNode`s
    /// - Returns: A list of `TreeSitterNode`s that contains all of the children of this node.
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
    
    
    /// Retrieves the named child at the given index from the list of children.
    /// - Parameter index: the index to retrieve the named child at
    /// - Returns: If there is a named child at the provided index, that child is returned.
    func getNamedChild(index: Int) -> TreeSitterNode? {
        let possibleChild = ts_node_named_child(rawNode, UInt32(index))
        return TreeSitterNode.getPossibleNode(node: possibleChild)
    }
    
    /// Retrieves a list of all of the named children converted to their own `TreeSitterNode`s
    /// - Returns: A list of `TreeSitterNode`s that contains all of the named children of this node.
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
    
    /// Retrieves the field name for a child at a provided index
    /// - Parameter index: The index of the child.
    /// - Returns: If there is a child at the provided index, and it has a field name that name is returned.
    func getFieldNameForChild(index: Int) -> String? {
        if let strPtr = ts_node_field_name_for_child(rawNode, UInt32(index)) {
            return String(cString: strPtr)
        }
        return nil
    }
    
    /// Returns the first child with the specified field name.
    /// - Parameter field: The field name to check for.
    /// - Returns: Returns the first child with the specified field name. If there is not child, nothing is returned.
    func getChild(by field: String) -> TreeSitterNode? {
        let possibleChild = ts_node_child_by_field_name(rawNode, field, UInt32(field.count))
        return TreeSitterNode.getPossibleNode(node: possibleChild)
    }
    
    /// Retrieves the contents of **this** node in the supplied content.
    /// - Parameter str: The content that contains this node
    /// - Returns: The content of this node
    func getContents(in str: String) -> String {
        let start = str.index(str.startIndex, offsetBy: startByte)
        let end = str.index(str.startIndex, offsetBy: endByte)
        
        return String(str[start ..< end])
    }
    
    /// Retrieves the contents of one of this node's children's contents.
    /// - Parameters:
    ///   - child: The child to receive the content for
    ///   - str: The string that contains the child. This string should be retrieved from ``TreeSitterNode/getContents(in:_)``
    /// - Returns: The substring of content that has contains the child node.
    func getContents(of child: TreeSitterNode, in str: String) -> String {
        let adjustedStartByte = child.startByte - startByte // This will be positive
        let adjustedEndByte = child.endByte - endByte // This will be negative
        
        let start = str.index(str.startIndex, offsetBy: adjustedStartByte)
        let end = str.index(str.endIndex, offsetBy: adjustedEndByte) // Because adjustedEndByte is negative we are using the end index, and offsetting by a negative value
        
        return String(str[start ..< end])
    }
}

extension TreeSitterNode {
    func errorMessage(in contents: String) -> String {
        let location = "line: \(startPoint.row + 1), "
        
        if hasError && (isMissing || self.type == "ERROR") { // This is the error node
            var sstring = self.string ?? "(Unknown Error)"
            sstring.removeLast()
            sstring.removeFirst()
            
            return "SYNTAX ERROR, \(location) \"\(sstring)\""
        } else { // We have a case of unexpected tokens
            return "Unexpected token(s): \(self.getContents(in: contents)), \(location)"
        }
    }
    
    func getError() -> TreeSitterNode? {
        guard hasError else { return nil }
        
        if self.isMissing || self.type == "ERROR" {
            return self
        }
        
        // Traverse the node tree until we find which one has an error
        for index in 0 ..< numberOfChildren {
            guard let child = self.getChild(index: index) else { continue }
            
            // Check to see if the child is the error. If not, check to see if it has an error. If so traverse down its tree to find the error
            if child.isMissing || child.type == "ERROR" {
                print("Found Error", child)
                return child
            } else if child.hasError {
                guard let errorChild = child.getError() else { continue }
                return errorChild
            }
        }
        
        return nil
        
    }
}

extension TreeSitterNode {
    /// A helper function that converts a `TSNode` into a possible `TreeSitterNode`. If the node ends up being `NULL` a Swift `nil` value is returned in place of a `TreeSitterNode`
    /// - Parameter node: The `TSNode` to convert into a `TreeSitterNode`
    /// - Returns: If the `node` is a valid `TreeSitterNode` it is returned. If not, nil is returned.
    static func getPossibleNode(node: TSNode) -> TreeSitterNode? {
        let node = TreeSitterNode(rawNode: node)
        return node.isNull ? nil : node
    }
}

extension TreeSitterNode: Equatable {
    /// Checks to see if the two `TreeSitterNode`s are equal to each other.
    /// - Parameters:
    ///   - lhs: The first node to check
    ///   - rhs: The second node to check
    /// - Returns: If the nodes are equal, true is returned,
    static func == (lhs: TreeSitterNode, rhs: TreeSitterNode) -> Bool {
        return ts_node_eq(lhs.rawNode, rhs.rawNode)
    }
}
