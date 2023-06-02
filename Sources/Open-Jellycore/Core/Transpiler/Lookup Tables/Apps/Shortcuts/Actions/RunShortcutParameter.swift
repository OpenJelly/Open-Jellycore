//
//  RunShortcutParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunShortcutParameter: ParameterProtocol, Codable {
	var WFWorkflowName: JellyArray<JellyString>?
	var WFInput: JellyVariableReference?
	var WFShowWorkflow: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunShortcutParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFWorkflowName = JellyArray<JellyString>(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShortcut", name: "name"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShortcut", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "show" }) {
            parameters.WFShowWorkflow = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShortcut", name: "show"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "Jellycuts Helper",
			"input": "ShortcutInput",
			"show": "false",

        ]
    }
}
