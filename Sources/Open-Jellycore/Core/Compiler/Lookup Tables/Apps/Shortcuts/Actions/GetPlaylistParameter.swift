//
//  GetPlaylistParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetPlaylistParameter: ParameterProtocol, Codable {
	var WFPlaylistName: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetPlaylistParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFPlaylistName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPlaylist", name: "name"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "Recently Played",

        ]
    }
}
