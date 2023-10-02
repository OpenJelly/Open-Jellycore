//
//  CreatePlaylistParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreatePlaylistParameter: ParameterProtocol, Codable {
	var WFPlaylistName: JellyString?
	var WFPlaylistItems: JellyVariableReference?
	var WFPlaylistAuthor: JellyString?
	var WFPlaylistDescription: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreatePlaylistParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFPlaylistName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "name"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "music" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFPlaylistItems = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "music"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "author" }) {
            parameters.WFPlaylistAuthor = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "author"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "description" }) {
            parameters.WFPlaylistDescription = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "description"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "${Name}'s Playlist",
			"music": "New Music",
			"author": "${Name}",
			"description": "${Name}'s favorite songs from 2021",

        ]
    }
}
