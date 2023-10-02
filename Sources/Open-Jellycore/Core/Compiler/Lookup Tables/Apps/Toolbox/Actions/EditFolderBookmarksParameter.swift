//
//  EditFolderBookmarksParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditFolderBookmarksParameter: ParameterProtocol, Codable {
	var mode: Jelly_EditFolderBookmarkMode?
	var urlName: JellyString?
	var deleteNames: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditFolderBookmarksParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_EditFolderBookmarkMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editFolderBookmarks", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "urlName" }) {
            parameters.urlName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editFolderBookmarks", name: "urlName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deleteNames" }) {
            parameters.deleteNames = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editFolderBookmarks", name: "deleteNames"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "Delete",
			"urlName": "Jellycuts",
			"deleteNames": "Files",

        ]
    }
}
