//
//  JellyAny.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 1/2/23.
//

/// `JellyAny` is a protocol that allows types like ``JellyArray`` to function.
/// It allows Jelly types to be put into arrays or other structures and still be interacted with.
protocol JellyAny: Codable {
    /// This initializer creates a ``JellyAny`` type taking in a ``CoreNode`` and the scope's variables
    /// - Parameters:
    ///   - value: the core node to convert to the Jelly type
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(_ value: CoreNode, scopedVariables: [Variable])
    
    /// This initializer creates a ``JellyAny`` type taking in a ``CorePrimitiveNode`` and the scope's variables
    /// This function has a default implementation that converts the ``CorePrimitiveNode`` to a ``CoreNode`` and passes it into the ``JellyAny/init(_:scopedVariables:)`` initializer.
    /// - Parameters:
    ///   - value: the core primitive node  to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(_ value: CorePrimitiveNode, scopedVariables: [Variable])
    
    /// This initializer creates a ``JellyAny`` type taking in a ``FunctionCallParameterItem`` and the scope's variables
    /// This function has a default implementation that converts the ``FunctionCallParameterItem`` to a ``CorePrimitiveNode`` by grabbing ``FunctionCallParameterItem/item``  and passes it into the ``JellyAny/init(_:scopedVariables:)`` initializer.
    /// - Parameters:
    ///   - value: the function call parameter item node  to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable])
}

extension JellyAny {
    /// This initializer creates a ``JellyAny`` type taking in a ``CorePrimitiveNode`` and the scope's variables
    /// This function has a default implementation that converts the ``CorePrimitiveNode`` to a ``CoreNode`` and passes it into the ``JellyAny/init(_:scopedVariables:)`` initializer.
    /// - Parameters:
    ///   - value: the core primitive node  to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(_ value: CorePrimitiveNode, scopedVariables: [Variable]) {
        if let coreNode = value as? CoreNode {
            self.init(coreNode, scopedVariables: scopedVariables)
        } else {
            return nil
        }
    }
    
    /// This initializer creates a ``JellyAny`` type taking in a ``FunctionCallParameterItem`` and the scope's variables
    /// This function has a default implementation that converts the ``FunctionCallParameterItem`` to a ``CorePrimitiveNode`` by grabbing ``FunctionCallParameterItem/item``  and passes it into the ``JellyAny/init(_:scopedVariables:)`` initializer.
    /// - Parameters:
    ///   - value: the function call parameter item node  to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable]) {
        if let item = parameterItem.item {
            self.init(item, scopedVariables: scopedVariables)
        } else {
            self.init(parameterItem, scopedVariables: scopedVariables)
        }
    }
}
