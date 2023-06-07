//
//  JellyArray.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 11/4/22.
//

/// An array type that allows for any value conforming to ``JellyAny`` to be placed in an Array of values.
struct JellyArray<InternalType: JellyAny>: JellyAny, Codable {
    /// The items that are included in the Array
    var items: [QuantumValue] = []
    
    /// This initializer creates a ``JellyArray`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyArray``.
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        if let arrayNode = value as? ArrayNode {
            for value in arrayNode.values {
                switch value.type {
                case .string:
                    items.append(QuantumValue(JellyString(value, scopedVariables: scopedVariables)))
                default:
                    if let typedItem: InternalType = InternalType(value, scopedVariables: scopedVariables) {
                        items.append(QuantumValue(typedItem))
                    }
                }
            }
        }
    }
        
    /// Encodes the ``JellyArray`` to the given `encoder`.
    /// - Parameter encoder: the encoder to encode into.
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(items)
    }
}
