//
//  Toolbox_CreatePlaylistParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Toolbox_CreatePlaylistParameter: ParameterProtocol, Codable {
	var name: JellyString?
	var playlistDescription: JellyString?
	var addType: Jelly_AddToPlaylistType?
	var songIDs: JellyArray<JellyVariableReference>?
	var albumIDs: JellyArray<JellyVariableReference>?
	var playlistIDs: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Toolbox_CreatePlaylistParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "playlistDescription" }) {
            parameters.playlistDescription = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "playlistDescription"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addType" }) {
            parameters.addType = Jelly_AddToPlaylistType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "addType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "songIDs" }) {
            parameters.songIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "songIDs"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "albumIDs" }) {
            parameters.albumIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "albumIDs"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "playlistIDs" }) {
            parameters.playlistIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPlaylist", name: "playlistIDs"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "\"Awesome Songs\"",
			"playlistDescription": "\"Some of my favorite songs\"",
			"addType": "songs",
			"songIDs": "[\"0\"]",
			"albumIDs": "[\"0\"]",
			"playlistIDs": "[\"0\"]",

        ]
    }
}
