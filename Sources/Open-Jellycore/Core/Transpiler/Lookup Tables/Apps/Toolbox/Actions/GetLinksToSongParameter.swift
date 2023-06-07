//
//  GetLinksToSongParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLinksToSongParameter: ParameterProtocol, Codable {
	var sourceURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLinksToSongParameter()

        if let value = call.first(where: { node in return node.slotName == "sourceURL" }) {
            parameters.sourceURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getLinksToSong", name: "sourceURL"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"sourceURL": "\"https://music.apple.com/us/album/saturday/1561836997?i=1561837010\"",

        ]
    }
}