//
//  JellyDictionary.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 1/2/23.
//

import Foundation

/// A type that represents a Shortcuts dictionary. This type takes in a string formatted in JSON and converts it into a format that is understood by shortcuts.
struct JellyDictionary: JellyPrimitiveType {
    typealias T = [String: QuantumValue]
    
    /// The coding keys needed for a Shortcuts dictionary.
    enum EncodingKeys: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
    }
    
    /// The raw value of ``JellyDictionary`` which is a swift dictionary using a String as a key and a ``QuantumValue``
    var value: [String: QuantumValue]
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyDictionary/value``.
    var variable: JellyVariableReference? = nil
    
    /// The default initializer for a ``JellyDictionary`` which creates using a Date.
    /// - Parameter value: A [String: QuantumValue] to be set as the ``JellyDictionary/value``
    init(_ value: T) {
        self.value = value
    }
    
    /// Attempts to initialize a ``JellyDictionary`` using a string that is converted to JSON and then parsed.
    /// - Parameter value: The JSON string value to convert into a ``JellyDictionary``
    init(_ value: String) throws {
        self.value = [:]
        
        let deEscaped = value.replacingOccurrences(of: #"\""#, with: #"""#)
        let data = Data(deEscaped.utf8)
        do {
            guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                throw JellycoreError.generic(description: "Invalid JSON Structure", recoveryStrategy: "Check your JSON Structure", level: .error)
            }
            self.value = convertJSONObjectToShortcutsDictionary(object: jsonDictionary, scopedVariables: [])
            
        } catch let error as NSError {
            ErrorReporter.shared.reportError(error: JellycoreError.unableToParseJSON(error: error), node: nil)
        }
    }
    
    /// This initializer creates a ``JellyDictionary`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyDictionary``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyDictionary``..
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        self.value = [:]
        
        if value.content.contains("{") {
            // Parse JSON
            let deEscaped = value.content.replacingOccurrences(of: #"\""#, with: #"""#)
            let data = Data(deEscaped.utf8)
            do {
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    throw JellycoreError.generic(description: "Invalid JSON Structure", recoveryStrategy: "Check your JSON Structure", level: .error)
                }
                self.value = convertJSONObjectToShortcutsDictionary(object: jsonDictionary, scopedVariables: scopedVariables)
                
            } catch let error as NSError {
                ErrorReporter.shared.reportError(error: JellycoreError.unableToParseJSON(error: error), node: value)
            }
        } else {
            // Load Jellycuts Dictionary from User Defaults
        }
    }
    
    /// Converts a JSON dictionary object of type [String: Any] into a Jelly representation of a dictionary,[String: QuantumValue]
    /// - Parameters:
    ///   - object: The JSON object to convert
    ///   - scopedVariables: The variables that are relevant to the scope of the dictionary.
    /// - Returns: A converted dictionary of type [String: QuantumValue] that is in the correct format to be used in Shortcuts encoding.
    func convertJSONObjectToShortcutsDictionary(object: [String: Any], scopedVariables: [Variable]) -> [String: QuantumValue] {
        var shortcutsFieldValueItems: [QuantumValue] = []
        
        for item in object {
            let keyDictionary = JellyString(item.key)
            
            if let value = item.value as? [Any] {
                let convertedArray = convertJSONArrayToShortcutsDictionaryArray(array: value, scopeVariables: scopedVariables)
                let valueDictionary: [String: Any] = [
                    "Value": convertedArray,
                    "WFSerializationType": "WFArrayParameterState"
                ]
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(2),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            } else if let value = item.value as? [String: Any] {
                let convertedDictionary = convertJSONObjectToShortcutsDictionary(object: value, scopedVariables: scopedVariables)
                let valueDictionary: [String: Any] = [
                    "Value": [
                        "Value": convertedDictionary,
                        "WFSerializationType": "WFDictionaryFieldValue",
                    ] as [String : Any],
                    "WFSerializationType": "WFDictionaryFieldValue"
                ]
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(1),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            } else if let value = item.value as? Bool {
                let valueDictionary = JellyBoolean(value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(4),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
                
            } else if let value = item.value as? Double {
                let valueDictionary = JellyString("\(value)")
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(3),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            } else if let value = item.value as? String {
                // TODO: Add back interpolation support for dictionaries
                let valueDictionary = JellyString(value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(0),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            }
        }
        
        return ["WFDictionaryFieldValueItems": QuantumValue(shortcutsFieldValueItems)]
    }
    
    
    /// Converts a JSON array of type [Any] into a Jelly representation of a dictionary array,[QuantumValue]
    /// - Parameters:
    ///   - object: The JSON array to convert
    ///   - scopedVariables: The variables that are relevant to the scope of the array.
    /// - Returns: A converted array of type [QuantumValue] that is in the correct format to be used in Shortcuts encoding.
    func convertJSONArrayToShortcutsDictionaryArray(array: [Any], scopeVariables: [Variable]) -> [QuantumValue] {
        var shortcutsFieldValueItems: [QuantumValue] = []
        
        for item in array {
            if let value = item as? [Any] {
                let convertedArray = convertJSONArrayToShortcutsDictionaryArray(array: value, scopeVariables: scopeVariables)
                let valueDictionary: [String: Any] = [
                    "Value": convertedArray,
                    "WFSerializationType": "WFArrayParameterState"
                ]
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(2),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            } else if let value = item as? [String: Any] {
                let convertedDictionary = convertJSONObjectToShortcutsDictionary(object: value, scopedVariables: scopeVariables)
                let valueDictionary: [String: Any] = [
                    "Value": [
                        "Value": convertedDictionary,
                        "WFSerializationType": "WFDictionaryFieldValue",
                    ] as [String : Any],
                    "WFSerializationType": "WFDictionaryFieldValue"
                ]
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(1),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            } else if let value = item as? Bool {
                let valueDictionary = JellyBoolean(value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(4),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
                
            } else if let value = item as? Double {
                let valueDictionary = JellyString("\(value)")
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(3),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            } else if let value = item as? String {
                // TODO: Add back interpolation support for dictionaries
                let valueDictionary = JellyString(value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(0),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            }
        }
        
        return shortcutsFieldValueItems
    }
                
    /// Encodes the ``JellyDictionary`` to the given `encoder`.
    /// - Parameter encoder: the encoder to encode into.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)
        
        try container.encode(value, forKey: .value)
    }
}
