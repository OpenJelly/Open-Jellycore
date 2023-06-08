//
//  GetUTIParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetUTIParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var decodeDynamic: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetUTIParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getUTI", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "decodeDynamic" }) {
            parameters.decodeDynamic = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getUTI", name: "decodeDynamic"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "shortcutInput",
			"decodeDynamic": "true",

        ]
    }
}