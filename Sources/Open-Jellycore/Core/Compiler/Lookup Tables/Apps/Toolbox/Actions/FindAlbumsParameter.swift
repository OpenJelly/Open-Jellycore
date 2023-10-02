//
//  FindAlbumsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindAlbumsParameter: ParameterProtocol, Codable {
	var searchMode: Jelly_AlbumSearchMode?
	var query: JellyString?
	var ids: JellyArray<JellyVariableReference>?
	var limitResults: JellyBoolean?
	var limitCount: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FindAlbumsParameter()

        if let value = call.first(where: { node in return node.slotName == "searchMode" }) {
            parameters.searchMode = Jelly_AlbumSearchMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findAlbums", name: "searchMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findAlbums", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "ids" }) {
            parameters.ids = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findAlbums", name: "ids"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitResults" }) {
            parameters.limitResults = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findAlbums", name: "limitResults"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitCount" }) {
            parameters.limitCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findAlbums", name: "limitCount"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"searchMode": "byName",
			"query": "Vibing",
			"ids": "",
			"limitResults": "false",
			"limitCount": "",

        ]
    }
}
