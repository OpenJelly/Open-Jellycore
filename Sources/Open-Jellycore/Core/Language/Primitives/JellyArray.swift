//
//  JellyArray.swift
//  
//
//  Created by Taylor Lineman on 11/4/22.
//

struct JellyArray<InternalType: JellyAny>: JellyAny, Codable {
    var items: [QuantumValue] = []
    
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
        
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(items)
    }
}
