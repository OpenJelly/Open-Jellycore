//
//  SaveFilesToBookmarkedFoldersParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SaveFilesToBookmarkedFoldersParameter: ParameterProtocol, Codable {
	var bookmarkedFolder: JellyArray<JellyVariableReference>?
	var files: JellyVariableReference?
	var subFolderPath: JellyString?
	var overwriteExisting: JellyBoolean?
	var tags: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SaveFilesToBookmarkedFoldersParameter()

        if let value = call.first(where: { node in return node.slotName == "bookmarkedFolder" }) {
            parameters.bookmarkedFolder = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveFilesToBookmarkedFolders", name: "bookmarkedFolder"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "files" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.files = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveFilesToBookmarkedFolders", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "subFolderPath" }) {
            parameters.subFolderPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveFilesToBookmarkedFolders", name: "subFolderPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overwriteExisting" }) {
            parameters.overwriteExisting = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveFilesToBookmarkedFolders", name: "overwriteExisting"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tags" }) {
            parameters.tags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveFilesToBookmarkedFolders", name: "tags"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"bookmarkedFolder": "[\"Jellycuts\"]",
			"files": "ShortcutInput",
			"subFolderPath": "Files/",
			"overwriteExisting": "true",
			"tags": "[\"Red\"]",

        ]
    }
}
