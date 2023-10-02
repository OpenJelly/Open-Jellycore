//
//  ReverseListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ReverseListParameter: ParameterProtocol, Codable {
	var list: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ReverseListParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "list" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.list = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "reverseList", name: "list"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "ShortcutInput",

        ]
    }
}
