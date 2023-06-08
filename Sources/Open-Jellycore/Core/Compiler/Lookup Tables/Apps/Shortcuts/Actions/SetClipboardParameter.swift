//
//  SetClipboardParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetClipboardParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFLocalOnly: JellyBoolean?
	var WFExpirationDate: JellyDate?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetClipboardParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "variable" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setClipboard", name: "variable"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "local" }) {
            parameters.WFLocalOnly = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setClipboard", name: "local"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "expiration" }) {
            parameters.WFExpirationDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setClipboard", name: "expiration"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"variable": "ShortcutInput",
			"local": "false",
			"expiration": "3:00pm",

        ]
    }
}