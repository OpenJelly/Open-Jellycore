//
//  ExitParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ExitParameter: ParameterProtocol, Codable {
	var WFResult: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ExitParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "var" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFResult = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "exit", name: "var"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"var": "ShortcutInput",

        ]
    }
}
