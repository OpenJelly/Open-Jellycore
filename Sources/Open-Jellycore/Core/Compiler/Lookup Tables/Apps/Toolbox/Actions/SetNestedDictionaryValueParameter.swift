//
//  SetNestedDictionaryValueParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetNestedDictionaryValueParameter: ParameterProtocol, Codable {
	var dictionary: JellyString?
	var path: JellyString?
	var mode: Jelly_SetDictionaryMode?
	var value: JellyString?
	var appendValue: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetNestedDictionaryValueParameter()

        if let value = call.first(where: { node in return node.slotName == "dictionary" }) {
            parameters.dictionary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setNestedDictionaryValue", name: "dictionary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.path = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setNestedDictionaryValue", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_SetDictionaryMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setNestedDictionaryValue", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.value = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setNestedDictionaryValue", name: "value"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "appendValue" }) {
            parameters.appendValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setNestedDictionaryValue", name: "appendValue"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"dictionary": "${ShortcutInput}",
			"path": "numbers/openCount/",
			"mode": "Set",
			"value": "${adjustedCount}",
			"appendValue": "",

        ]
    }
}