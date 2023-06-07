//
//  GetTvShowDetailsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetTvShowDetailsParameter: ParameterProtocol, Codable {
	var tvShow: Jelly_TvShow?
	var providersLocale: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetTvShowDetailsParameter()

        if let value = call.first(where: { node in return node.slotName == "tvShow" }) {
            parameters.tvShow = Jelly_TvShow(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTvShowDetails", name: "tvShow"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "providersLocale" }) {
            parameters.providersLocale = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTvShowDetails", name: "providersLocale"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"tvShow": "TvShow(identifier: \"Ted_Lasso\", displayString: \"Ted Lasso\", title: \"Ted Lasso\", overview: \"A really good show\", firstAirDate: August 14, 2020, tmdb_id: 97456, voteCount: 42, voteAverage: .85, popularity: .85, posterURL: \"https://www.themoviedb.org/tv/97546-ted-lasso?language=en-US#\", posterThumbURL: \"https://www.themoviedb.org/tv/97546-ted-lasso?language=en-US#\", genres: \"Comedy\")",
			"providersLocale": "Apple TV",

        ]
    }
}
