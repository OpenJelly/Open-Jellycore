//
//  OverwriteFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OverwriteFileParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var overwrite: JellyVariableReference?
	var isFolder: JellyBoolean?
	var path: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OverwriteFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overwriteFile", name: "file"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "overwrite" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.overwrite = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overwriteFile", name: "overwrite"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isFolder" }) {
            parameters.isFolder = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overwriteFile", name: "isFolder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.path = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overwriteFile", name: "path"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",
			"overwrite": "Clipboard",
			"isFolder": "true",
			"path": "\"/jellycuts/\"",

        ]
    }
}