//
//  CoreNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

/// A protocol that defines what makes up the core pieces of a node used by the compiler. This is used to generalize functions across the compiler and allow for a large expansion on node types.
protocol CoreNode {
    /// The type of the node, converted from the TreeSitterType
    var type: CoreNodeType { get }
    /// The TreeSitter string that represents the node's `rawValue`
    var sString: String { get }
    /// The content of the node that is retrieved from the node's parent text.
    var content: String { get }
    /// The raw `TreeSitterNode` that this type wraps.
    var rawValue: TreeSitterNode { get }
}
