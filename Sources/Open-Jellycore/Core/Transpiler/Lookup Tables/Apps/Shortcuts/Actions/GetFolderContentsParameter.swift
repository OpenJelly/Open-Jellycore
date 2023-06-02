//
//  GetFolderContentsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFolderContentsParameter: ParameterProtocol, Codable {
	var WFFolder: JellyVariableReference?
	var Recursive: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFolderContentsParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "folder" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFFolder = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFolderContents", name: "folder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "recursive" }) {
            parameters.Recursive = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFolderContents", name: "recursive"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"folder": "ShortcutInput",
			"recursive": "true",

        ]
    }
}