//
//  AppendNoteParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AppendNoteParameter: ParameterProtocol, Codable {
	var WFInput: JellyString?
	var WFNote: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AppendNoteParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFInput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "appendNote", name: "text"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "note" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFNote = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "appendNote", name: "note"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Make sure to join the Jellycuts discord at https://jellycuts.com",
			"note": "to-do",

        ]
    }
}