//
//  RunShortcutParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunShortcutParameter: ParameterProtocol, Codable {
	var WFWorkflowName: JellyString?
	var WFInput: JellyVariableReference?
	var WFShowWorkflow: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunShortcutParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFWorkflowName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runShortcut", name: "name"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runShortcut", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "show" }) {
            parameters.WFShowWorkflow = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runShortcut", name: "show"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "Jellycuts Helper",
			"input": "ShortcutInput",
			"show": "false",

        ]
    }
}
