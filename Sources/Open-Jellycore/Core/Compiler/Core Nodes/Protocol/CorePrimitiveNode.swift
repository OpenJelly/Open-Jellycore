//
//  CorePrimitiveNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/3/23.
//

/// A protocol that matches up with the `CoreNode` parameter but allows us to specify we only want a primitive node.
protocol CorePrimitiveNode {
    /// The type of the node, converted from the TreeSitterType
    var type: CoreNodeType { get }
    /// The content of the node that is retrieved from the node's parent text.
    var content: String { get }
    /// The raw `TreeSitterNode` that this type wraps.
    var rawValue: TreeSitterNode { get }

}
