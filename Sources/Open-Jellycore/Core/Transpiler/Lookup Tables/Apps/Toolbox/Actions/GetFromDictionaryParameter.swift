//
//  GetFromDictionaryParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFromDictionaryParameter: ParameterProtocol, Codable {
	var type: Jelly_GetFromDictType?
	var keysContaining: JellyString?
	var keysNotContaining: JellyString?
	var dictionary: JellyString?
	var caseSensitive: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFromDictionaryParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_GetFromDictType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFromDictionary", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keysContaining" }) {
            parameters.keysContaining = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFromDictionary", name: "keysContaining"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keysNotContaining" }) {
            parameters.keysNotContaining = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFromDictionary", name: "keysNotContaining"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dictionary" }) {
            parameters.dictionary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFromDictionary", name: "dictionary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseSensitive" }) {
            parameters.caseSensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFromDictionary", name: "caseSensitive"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "GetValuesOfKeysContaining",
			"keysContaining": "Name",
			"keysNotContaining": "",
			"dictionary": "${ShortcutInput}",
			"caseSensitive": "false",

        ]
    }
}