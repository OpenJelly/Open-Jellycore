//
//  RunFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunFileParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var arguments: JellyArray<JellyVariableReference>?
	var runInApp: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runFile", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "arguments" }) {
            parameters.arguments = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runFile", name: "arguments"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "runInApp" }) {
            parameters.runInApp = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runFile", name: "runInApp"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "inputFile",
			"arguments": "[]",
			"runInApp": "false",

        ]
    }
}