//
//  ShuffleListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShuffleListParameter: ParameterProtocol, Codable {
	var limit: JellyBoolean?
	var limitCount: JellyInteger?
	var list: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShuffleListParameter()

        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shuffleList", name: "limit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitCount" }) {
            parameters.limitCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shuffleList", name: "limitCount"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "list" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.list = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shuffleList", name: "list"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"limit": "true",
			"limitCount": "5",
			"list": "ShortcutInput",

        ]
    }
}