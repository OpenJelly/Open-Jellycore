//
//  SetValueParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetValueParameter: ParameterProtocol, Codable {
	var WFDictionaryKey: JellyString?
	var WFDictionaryValue: JellyString?
	var WFDictionary: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetValueParameter()

        if let value = call.first(where: { node in return node.slotName == "key" }) {
            parameters.WFDictionaryKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "key"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.WFDictionaryValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "value"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "dictionary" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFDictionary = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "dictionary"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"key": "ShortcutName",
			"value": "Jellycuts Helper",
			"dictionary": "Meta",

        ]
    }
}