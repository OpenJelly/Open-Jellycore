//
//  AddMusicToLibraryParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddMusicToLibraryParameter: ParameterProtocol, Codable {
	var songIDs: JellyArray<JellyVariableReference>?
	var albumIDs: JellyArray<JellyVariableReference>?
	var playlistIDs: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddMusicToLibraryParameter()

        if let value = call.first(where: { node in return node.slotName == "songIDs" }) {
            parameters.songIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addMusicToLibrary", name: "songIDs"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "albumIDs" }) {
            parameters.albumIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addMusicToLibrary", name: "albumIDs"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "playlistIDs" }) {
            parameters.playlistIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addMusicToLibrary", name: "playlistIDs"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"songIDs": "[ShortcutInput]",
			"albumIDs": "[]",
			"playlistIDs": "[PlaylistID]",

        ]
    }
}
