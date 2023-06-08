//
//  RateSongsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RateSongsParameter: ParameterProtocol, Codable {
	var ratingMode: Jelly_SongRatingMode?
	var rating: Jelly_SongRating?
	var id: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RateSongsParameter()

        if let value = call.first(where: { node in return node.slotName == "ratingMode" }) {
            parameters.ratingMode = Jelly_SongRatingMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "rateSongs", name: "ratingMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rating" }) {
            parameters.rating = Jelly_SongRating(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "rateSongs", name: "rating"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "id" }) {
            parameters.id = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "rateSongs", name: "id"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"ratingMode": "set",
			"rating": "love",
			"id": "${ShortcutInput}",

        ]
    }
}