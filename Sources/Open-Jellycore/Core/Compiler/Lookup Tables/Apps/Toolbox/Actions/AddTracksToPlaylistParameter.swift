//
//  AddTracksToPlaylistParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddTracksToPlaylistParameter: ParameterProtocol, Codable {
	var playlist: Jelly_Playlist?
	var trackIDs: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddTracksToPlaylistParameter()

        if let value = call.first(where: { node in return node.slotName == "playlist" }) {
            parameters.playlist = Jelly_Playlist(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addTracksToPlaylist", name: "playlist"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "trackIDs" }) {
            parameters.trackIDs = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addTracksToPlaylist", name: "trackIDs"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"playlist": "Playlist(identifier: \"Test\", displayString: \"My Playlist\", catalougeID: \"214123\", name: \"My Playlist\", url: \"https://example.com\", musicURL: \"https://example.com\", lastModifiedData: March 21st 2022, curator: \"Zachary Lineman\", artworkColors: \"#ffffff\", artworkMaxHeight: 256, artworkMaxWidth: 256, artworkURL_thumb: \"\", artowrkURL_small: \"\", artowrkURL_medium: \"\", artworkURL_full: \"\", editorialShort: \"\", editorialLong: \"\", type: 0, songNames: \"\", songsDict: \"\", thumbnail: 21124dS)",
			"trackIDs": "[\"1564531202\"]",

        ]
    }
}
