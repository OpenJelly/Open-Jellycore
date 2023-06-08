//
//  ListContentsOfBookmarkedFolderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ListContentsOfBookmarkedFolderParameter: ParameterProtocol, Codable {
	var bookmarkedFolder: JellyString?
	var subFolderPath: JellyString?
	var filter: Jelly_FileType?
	var thumbs: Jelly_ThumbnailType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ListContentsOfBookmarkedFolderParameter()

        if let value = call.first(where: { node in return node.slotName == "bookmarkedFolder" }) {
            parameters.bookmarkedFolder = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listContentsOfBookmarkedFolder", name: "bookmarkedFolder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "subFolderPath" }) {
            parameters.subFolderPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listContentsOfBookmarkedFolder", name: "subFolderPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "filter" }) {
            parameters.filter = Jelly_FileType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listContentsOfBookmarkedFolder", name: "filter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "thumbs" }) {
            parameters.thumbs = Jelly_ThumbnailType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listContentsOfBookmarkedFolder", name: "thumbs"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"bookmarkedFolder": "Jellycuts",
			"subFolderPath": "Files/",
			"filter": "All",
			"thumbs": "Previews",

        ]
    }
}