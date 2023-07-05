//
//  EncodeHexParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EncodeHexParameter: ParameterProtocol, Codable {
	var operation: Jelly_EncodeHexOperation?
	var input: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EncodeHexParameter()

        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_EncodeHexOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeHex", name: "operation"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeHex", name: "input"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"operation": "encode",
			"input": "ShortcutInput",

        ]
    }
}