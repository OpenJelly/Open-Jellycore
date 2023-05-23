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
                
            }
        }
        // TODO: Re-setup array type
//        if let value = value as? ArrayNode {
//            for item in value.arrayValues {
//                switch item.type {
//                case .string:
//                    items.append(QuantumValue(JellyString(item, scopedVariables: scopedVariables)))
//                default:
//                    if let typedItem: InternalType = InternalType(item, scopedVariables: scopedVariables) {
//                        items.append(QuantumValue(typedItem))
//                    }
//                }
//            }
//        }
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(items)
    }
}
