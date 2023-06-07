//
//  FindMoviesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindMoviesParameter: ParameterProtocol, Codable {
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
        var parameters = FindMoviesParameter()

        if let value = call.first(where: { node in return node.slotName == "advancedSearch" }) {
            parameters.advancedSearch = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "advancedSearch"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortBy" }) {
            parameters.sortBy = Jelly_TmdbTvSort(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "sortBy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "descendingSortOrder" }) {
            parameters.descendingSortOrder = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "descendingSortOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "afterYear" }) {
            parameters.afterYear = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "afterYear"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "beforeYear" }) {
            parameters.beforeYear = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "beforeYear"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "moreVotesThan" }) {
            parameters.moreVotesThan = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "moreVotesThan"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scoreBetterThan" }) {
            parameters.scoreBetterThan = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "scoreBetterThan"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includingGenres" }) {
            parameters.includingGenres = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "includingGenres"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "excludingGenres" }) {
            parameters.excludingGenres = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "excludingGenres"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeProviders" }) {
            parameters.includeProviders = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "includeProviders"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "providerRegion" }) {
            parameters.providerRegion = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "providerRegion"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "renderThumbnails" }) {
            parameters.renderThumbnails = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "renderThumbnails"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultCount" }) {
            parameters.resultCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findMovies", name: "resultCount"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"advancedSearch": "false",
			"query": "\"Star Wars\"",
			"sortBy": "firstAired",
			"descendingSortOrder": "true",
			"afterYear": "1980",
			"beforeYear": "2000",
			"moreVotesThan": "",
			"scoreBetterThan": "",
			"includingGenres": "",
			"excludingGenres": "",
			"includeProviders": "",
			"providerRegion": "",
			"renderThumbnails": "",
			"resultCount": "",

        ]
    }
}