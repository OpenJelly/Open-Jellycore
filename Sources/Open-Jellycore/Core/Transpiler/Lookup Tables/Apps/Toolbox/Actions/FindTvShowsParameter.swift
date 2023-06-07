//
//  FindTvShowsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindTvShowsParameter: ParameterProtocol, Codable {
	var advancedSearch: JellyBoolean?
	var query: JellyString?
	var sortBy: Jelly_TmdbTvSort?
	var descendingSortOrder: JellyBoolean?
	var afterYear: JellyInteger?
	var beforeYear: JellyInteger?
	var moreVotesThan: JellyInteger?
	var scoreBetterThan: JellyInteger?
	var includingGenres: JellyArray<JellyVariableReference>?
	var excludingGenres: JellyArray<JellyVariableReference>?
	var includeProviders: JellyArray<JellyVariableReference>?
	var providerRegion: JellyString?
	var renderThumbnails: JellyBoolean?
	var resultCount: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FindTvShowsParameter()

        if let value = call.first(where: { node in return node.slotName == "advancedSearch" }) {
            parameters.advancedSearch = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "advancedSearch"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortBy" }) {
            parameters.sortBy = Jelly_TmdbTvSort(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "sortBy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "descendingSortOrder" }) {
            parameters.descendingSortOrder = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "descendingSortOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "afterYear" }) {
            parameters.afterYear = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "afterYear"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "beforeYear" }) {
            parameters.beforeYear = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "beforeYear"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "moreVotesThan" }) {
            parameters.moreVotesThan = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "moreVotesThan"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scoreBetterThan" }) {
            parameters.scoreBetterThan = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "scoreBetterThan"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includingGenres" }) {
            parameters.includingGenres = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "includingGenres"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "excludingGenres" }) {
            parameters.excludingGenres = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "excludingGenres"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeProviders" }) {
            parameters.includeProviders = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "includeProviders"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "providerRegion" }) {
            parameters.providerRegion = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "providerRegion"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "renderThumbnails" }) {
            parameters.renderThumbnails = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "renderThumbnails"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultCount" }) {
            parameters.resultCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findTvShows", name: "resultCount"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"advancedSearch": "true",
			"query": "Star Wars",
			"sortBy": "",
			"descendingSortOrder": "firstAired",
			"afterYear": "1940",
			"beforeYear": "2022",
			"moreVotesThan": "1",
			"scoreBetterThan": "7",
			"includingGenres": "Comedy",
			"excludingGenres": "Drama",
			"includeProviders": "Netflix",
			"providerRegion": "en_us",
			"renderThumbnails": "true",
			"resultCount": "5",

        ]
    }
}