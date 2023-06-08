//
//  GetRecentSongsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetRecentSongsParameter: ParameterProtocol, Codable {
	var limitResults: JellyBoolean?
	var limitCount: JellyInteger?
	var recentMusicType: Jelly_RecentMusicType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetRecentSongsParameter()

        if let value = call.first(where: { node in return node.slotName == "limitResults" }) {
            parameters.limitResults = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRecentSongs", name: "limitResults"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitCount" }) {
            parameters.limitCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRecentSongs", name: "limitCount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "recentMusicType" }) {
            parameters.recentMusicType = Jelly_RecentMusicType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRecentSongs", name: "recentMusicType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"limitResults": "true",
			"limitCount": "5",
			"recentMusicType": "recentlyPlayed",

        ]
    }
}