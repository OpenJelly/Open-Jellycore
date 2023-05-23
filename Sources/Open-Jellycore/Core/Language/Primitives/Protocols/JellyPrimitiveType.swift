//
//  JellyPrimitiveType.swift
//  
//
//  Created by Taylor Lineman on 10/27/22.
//

protocol JellyPrimitiveType: JellyAny, Codable {
    associatedtype T: Encodable
    var value: T { get set }
    var variable: JellyVariableReference? { get set }

    init(_ value: T)
    
    init(_ value: String) throws
    
    init?(_ value: CoreNode)
}

extension JellyPrimitiveType {
    func encode(to encoder: Encoder) throws {
        if let variable {
            try variable.encode(to: encoder)
        } else {
            var container = encoder.singleValueContainer()
            try container.encode(value)
        }
    }
}
