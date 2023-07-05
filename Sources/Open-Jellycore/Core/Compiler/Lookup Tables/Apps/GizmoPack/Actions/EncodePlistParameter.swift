//
//  EncodePlistParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EncodePlistParameter: ParameterProtocol, Codable {
	var operation: Jelly_EncodeDecode?
	var format: Jelly_PlistFormat?
	var input: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EncodePlistParameter()

        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_EncodeDecode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodePlist", name: "operation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.format = Jelly_PlistFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodePlist", name: "format"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodePlist", name: "input"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"operation": "encode",
			"format": "xml",
			"input": "ShortcutInput",

        ]
    }
}