//
//  JellyDictionary.swift
//  
//
//  Created by Taylor Lineman on 1/2/23.
//

import Foundation

struct DictionaryItem: Codable {
    public var type: String
    public var key: String
    public var value: String
}

struct Dictionary: Codable {
    public var name: String
    public var items: [DictionaryItem]
}

struct JellyDictionary: JellyPrimitiveType {
    typealias T = [String: QuantumValue]
    
    enum EncodingKeys: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
    }

    var value: [String: QuantumValue]
    var variable: JellyVariableReference? = nil

    init(_ value: T) {
        self.value = value
    }
    
    init(_ value: String) throws {
        self.value = [:]
    }
    
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        self.value = [:]
        // TODO: Re-setup dictionary type
        if !value.content.contains("{") {
            if UserDefaults.standard.object(forKey: "Dicts") != nil {
                let storedObject: Data = UserDefaults.standard.object(forKey: "Dicts") as? Data ?? Data()
                let storedList: [Dictionary]? = try? PropertyListDecoder().decode([Dictionary].self, from: storedObject)

                let dicts = storedList ?? [Dictionary]()
                if let builtDict = dicts.first(where: { (dict) -> Bool in return
                    dict.name.replacingOccurrences(of: " ", with: "") == value.content
                }) {
                    self.value = convertFromDictionary(dict: builtDict)
                } else {
                    ErrorReporter.shared.reportError(error: .syntax(description: "Invalid Dictionary Builder Dictionary. There is no dictionary named \(value.content)", recoveryStrategy: "Create a dictionary in the dictionary builder with the name \(value.content)"), node: value)
                }
            }

        } else {
            // Parse JSON
            let data = Data(value.content.utf8)
            do {
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    throw JellycoreError.generic(description: "Invalid JSON Structure", recoveryStrategy: "Check your JSON Structure", level: .error)
                }
                self.value = convertJSONObjectToShortcutsDictionary(object: jsonDictionary, scopedVariables: scopedVariables)

            } catch let error as NSError {
                ErrorReporter.shared.reportError(error: JellycoreError.unableToParseJSON(error: error), node: value)
            }
        }
    }

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
    
    //Convert from dictionary made in the dictionary builder to a shortcuts dictionary
    func convertFromDictionary(dict: Dictionary) -> [String: QuantumValue] {
        var shortcutsFieldValueItems: [QuantumValue] = []

        for item in dict.items {
            let keyDictionary = JellyString(item.key)
            
            switch item.type {
            case "Dictionary":
                let newDict = Dictionary(name: item.key, items: decodeValues(dictionary: item.value))
                let convertedDictionary = convertFromDictionary(dict: newDict)
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
            case "Array":
                let array = decodeValues(dictionary: item.value)
                let convertedArray = convertFromArray(array: array)
                
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

            case "Text":
                let valueDictionary = JellyString(item.value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(0),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            case "Boolean":
                let valueDictionary = try? JellyBoolean(item.value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(4),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary ?? false
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            case "Number":
                let valueDictionary = JellyString(item.value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(3),
                    "WFKey": keyDictionary,
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            case "File":
                break
            default:
                break
            }
        }

        return ["WFDictionaryFieldValueItems": QuantumValue(shortcutsFieldValueItems)]
    }
    
    //Decode dictionary items from dictionary builder
    func decodeValues(dictionary: String) -> [DictionaryItem] {
        let decoder = JSONDecoder()
        let jsonObjects = try? decoder.decode([DictionaryItem].self, from: dictionary.data(using: .utf8) ?? Data())
        return jsonObjects ?? []
    }


    //Convert from array made in the dictionary builder to a shortcuts array
    func convertFromArray(array: [DictionaryItem]) -> [QuantumValue] {
        var shortcutsFieldValueItems: [QuantumValue] = []

        for item in array {
            switch item.type {
            case "Dictionary":
                let newDict = Dictionary(name: item.key, items: decodeValues(dictionary: item.value))
                let convertedDictionary = convertFromDictionary(dict: newDict)
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
            case "Array":
                let array = decodeValues(dictionary: item.value)
                let convertedArray = convertFromArray(array: array)
                
                let valueDictionary: [String: Any] = [
                    "Value": convertedArray,
                    "WFSerializationType": "WFArrayParameterState"
                ]
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(2),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))

            case "Text":
                let valueDictionary = JellyString(item.value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(0),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            case "Boolean":
                let valueDictionary = try? JellyBoolean(item.value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(4),
                    "WFValue": valueDictionary ?? false
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            case "Number":
                let valueDictionary = JellyString(item.value)
                let fieldValueItem: [String: Any] = [
                    "WFItemType": JellyInteger(3),
                    "WFValue": valueDictionary
                ]
                shortcutsFieldValueItems.append(QuantumValue(fieldValueItem))
            case "File":
                break
            default:
                break
            }

        }

        return shortcutsFieldValueItems
    }

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)

        try container.encode(value, forKey: .value)
    }
}
