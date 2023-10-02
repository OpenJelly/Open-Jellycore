//
//  Actions_AddToListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_AddToListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var item: JellyVariableReference?
	var prepend: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_AddToListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "list"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "item" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.item = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "item"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "prepend" }) {
            parameters.prepend = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "prepend"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[ShortcutInput, CurrentDate]",
			"item": "Clipboard",
			"prepend": "false",

        ]
    }
}
