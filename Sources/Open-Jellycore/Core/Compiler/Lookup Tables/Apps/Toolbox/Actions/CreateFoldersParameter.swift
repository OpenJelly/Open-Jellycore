//
//  CreateFoldersParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateFoldersParameter: ParameterProtocol, Codable {
	var bookmarkNames: JellyArray<JellyVariableReference>?
	var paths: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateFoldersParameter()

        if let value = call.first(where: { node in return node.slotName == "bookmarkNames" }) {
            parameters.bookmarkNames = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createFolders", name: "bookmarkNames"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "paths" }) {
            parameters.paths = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createFolders", name: "paths"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"bookmarkNames": "Jellycuts",
			"paths": "Files/",

        ]
    }
}