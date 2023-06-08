//
//  DeleteFilesInBookmarkedFolderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DeleteFilesInBookmarkedFolderParameter: ParameterProtocol, Codable {
	var bookmarkedFolder: JellyString?
	var filePaths: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DeleteFilesInBookmarkedFolderParameter()

        if let value = call.first(where: { node in return node.slotName == "bookmarkedFolder" }) {
            parameters.bookmarkedFolder = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFilesInBookmarkedFolder", name: "bookmarkedFolder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "filePaths" }) {
            parameters.filePaths = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "deleteFilesInBookmarkedFolder", name: "filePaths"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"bookmarkedFolder": "Jellycuts",
			"filePaths": "[\"Files/Shortcuts\"]",

        ]
    }
}