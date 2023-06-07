//
//  DeleteFromDictionaryParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DeleteFromDictionaryParameter: ParameterProtocol, Codable {
	var dictionary: JellyString?
	var type: Jelly_DeleteDictType?
	var keys: JellyArray<JellyVariableReference>?
	var valueQuery: JellyString?
	var keyQuery: JellyString?
	var dictionaryToMerge: JellyString?
	var removeEmptyValues: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DeleteFromDictionaryParameter()

        if let value = call.first(where: { node in return node.slotName == "dictionary" }) {
            parameters.dictionary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "dictionary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_DeleteDictType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keys" }) {
            parameters.keys = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "keys"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "valueQuery" }) {
            parameters.valueQuery = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "valueQuery"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keyQuery" }) {
            parameters.keyQuery = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "keyQuery"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dictionaryToMerge" }) {
            parameters.dictionaryToMerge = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "dictionaryToMerge"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeEmptyValues" }) {
            parameters.removeEmptyValues = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFromDictionary", name: "removeEmptyValues"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"dictionary": "\"${My Dictionary Variable}\"",
			"type": "deleteKey",
			"keys": "[\"name\"]",
			"valueQuery": "\"\"",
			"keyQuery": "\"\"",
			"dictionaryToMerge": "\"\"",
			"removeEmptyValues": "true",

        ]
    }
}