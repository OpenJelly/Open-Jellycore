//
//  GetMovieDetailsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetMovieDetailsParameter: ParameterProtocol, Codable {
	var movie: Jelly_Movie?
	var providersLocale: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetMovieDetailsParameter()

        if let value = call.first(where: { node in return node.slotName == "movie" }) {
            parameters.movie = Jelly_Movie(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getMovieDetails", name: "movie"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "providersLocale" }) {
            parameters.providersLocale = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getMovieDetails", name: "providersLocale"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"movie": "Movie(identifier: \"Movie1\", displayString: \"Star Wars\", tmbd_id: \"a32jsaf\", title: \"Star Wars\", posterThumbURL: \", posterURL: \"\", voteAverage: 0.4, voteCount: 3, releaseData: January 1st 1999, popularity: 0.9, overview: \"Space\", genres: \"Sci-Fi\")",
			"providersLocale": "en_us",

        ]
    }
}
