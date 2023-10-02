//
//  ShortcutDetailParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShortcutDetailParameter: ParameterProtocol, Codable {
	var detail: Jelly_WFContentItemPropertyName?
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShortcutDetailParameter()

        if let value = call.first(where: { node in return node.slotName == "detail" }) {
            parameters.detail = Jelly_WFContentItemPropertyName(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "shortcutDetail", name: "detail"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "shortcutDetail", name: "input"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"detail": "Icon",
			"input": "shortcut",

        ]
    }
}
