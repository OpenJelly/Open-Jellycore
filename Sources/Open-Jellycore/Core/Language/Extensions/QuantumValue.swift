//
//  QuantumValue.swift
//  Jellycore
//
//  Created by Taylor lineman on 10/30/20.
//

import Foundation

/// A custom class with the purpose  of allowing a swift `Any` value to be encoded and decoded. Extremely useful for encoding PLISTs and used all across Jellycore
struct QuantumValue: Decodable {
    /// The internal `Any` value
    var value: Any
    
    struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        init?(intValue: Int) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        }
        init?(stringValue: String) { self.stringValue = stringValue }
    }
    
    
    /// A basic initializer for a Quantum Value
    /// - Parameter value: The value that needs to be encoded.
    init(_ value: Any) {
        self.value = value
    }
    
    
    /// Initializes a QuantumValue from a decoder.
    /// The value is decoded based on what it can possibly decode by doing consecutive if let statements to find the matching type.
    /// - Parameter decoder: The decoder to decode with
    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            var result = [String: Any]()
            try container.allKeys.forEach { (key) throws in
                result[key.stringValue] = try container.decode(QuantumValue.self, forKey: key).value
            }
            value = result
        } else if var container = try? decoder.unkeyedContainer() {
            var result = [Any]()
            while !container.isAtEnd {
                result.append(try container.decode(QuantumValue.self).value)
            }
            value = result
        } else if let container = try? decoder.singleValueContainer() {
            if let doubleVal = try? container.decode(Double.self) {
                value = doubleVal
            } else if let intVal = try? container.decode(Int.self) {
                value = intVal
            } else if let doubleVal = try? container.decode(Double.self) {
                value = doubleVal
            } else if let boolVal = try? container.decode(Bool.self) {
                value = boolVal
            } else if let stringVal = try? container.decode(String.self) {
                value = stringVal
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "the container contains nothing serializable")
            }
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not serialize"))
        }
    }
}

extension QuantumValue: Encodable {
    /// An encoder to encode the internal `value` into an encodable type.
    /// Finds the type of the internal value by doing consecutive if let statements until one properly encodes.
    /// - Parameter encoder: The encoder to encode with.
    func encode(to encoder: Encoder) throws {
        if let array = value as? [Any] {
            var container = encoder.unkeyedContainer()
            for value in array {
                let decodable = QuantumValue(value)
                try container.encode(decodable)
            }
        } else if let dictionary = value as? [String: Any] {
            var container = encoder.container(keyedBy: CodingKeys.self)
            for (key, value) in dictionary {
                let codingKey = CodingKeys(stringValue: key)!
                let decodable = QuantumValue(value)
                try container.encode(decodable, forKey: codingKey)
            }
        } else {
            var container = encoder.singleValueContainer()
            if let numberValue = value as? Double {
                try container.encode(numberValue)
            } else if let dateValue = value as? Date {
                try container.encode(dateValue)
            } else if let intVal = value as? Int {
                try container.encode(intVal)
            } else if let doubleVal = value as? Double {
                try container.encode(doubleVal)
            } else if let boolVal = value as? Bool {
                try container.encode(boolVal)
            } else if let stringVal = value as? String {
                try container.encode(stringVal)
            } else if let quantamVal = value as? QuantumValue {
                try container.encode(quantamVal)
            }
            // MARK: Attempting to encode custom Jelly Variables
            else if let booleanReference = value as? JellyBoolean {
                try container.encode(booleanReference)
            } else if let dateReference = value as? JellyDate {
                try container.encode(dateReference)
            } else if let doubleReference = value as? JellyDouble {
                try container.encode(doubleReference)
            } else if let integerReference = value as? JellyInteger {
                try container.encode(integerReference)
            } else if let integerBooleanReference = value as? JellyIntegerBoolean {
                try container.encode(integerBooleanReference)
            } else if let stringReference = value as? JellyString {
                try container.encode(stringReference)
            } else if let variableReference = value as? JellyVariableReference {
                try container.encode(variableReference)
            } else if let aggrandizement = value as? Aggrandizement {
                try container.encode(aggrandizement)
            } else {
                throw EncodingError.invalidValue(value, EncodingError.Context.init(codingPath: encoder.codingPath, debugDescription: "The value is not encodable"))
            }
            
        }
    }
}
