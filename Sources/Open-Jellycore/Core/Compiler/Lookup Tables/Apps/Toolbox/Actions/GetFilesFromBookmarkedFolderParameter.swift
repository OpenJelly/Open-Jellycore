//
//  GetFilesFromBookmarkedFolderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFilesFromBookmarkedFolderParameter: ParameterProtocol, Codable {
	var bookmarkedFolder: JellyString?
	var filePath: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFilesFromBookmarkedFolderParameter()

        if let value = call.first(where: { node in return node.slotName == "bookmarkedFolder" }) {
            parameters.bookmarkedFolder = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFilesFromBookmarkedFolder", name: "bookmarkedFolder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "filePath" }) {
            parameters.filePath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFilesFromBookmarkedFolder", name: "filePath"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"bookmarkedFolder": "Jellycuts",
			"filePath": "[\"Files/\"]",

        ]
    }
}