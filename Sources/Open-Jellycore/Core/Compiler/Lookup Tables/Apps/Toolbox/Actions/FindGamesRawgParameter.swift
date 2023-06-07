//
//  FindGamesRawgParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindGamesRawgParameter: ParameterProtocol, Codable {
	var query: JellyString?
	var queryMatching: Jelly_RawgQueryMatching?
	var platforms: JellyArray<JellyVariableReference>?
	var genres: JellyArray<JellyVariableReference>?
	var stores: JellyArray<JellyVariableReference>?
	var playerType: Jelly_GamePlayers?
	var perspective: Jelly_RawgPerspective?
	var worldTypes: JellyArray<JellyVariableReference>?
	var scoreAbove: JellyInteger?
	var subtitleType: Jelly_GameSubtitleType?
	var excludeAdditions: JellyBoolean?
	var sortOrder: Jelly_RawgSortOrder?
	var descendingOrder: JellyBoolean?
	var afterYear: JellyInteger?
	var beforeYear: JellyInteger?
	var renderThumbnails: JellyBoolean?
	var resultCount: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FindGamesRawgParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryMatching" }) {
            parameters.queryMatching = Jelly_RawgQueryMatching(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "queryMatching"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "platforms" }) {
            parameters.platforms = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "platforms"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "genres" }) {
            parameters.genres = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "genres"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "stores" }) {
            parameters.stores = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "stores"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "playerType" }) {
            parameters.playerType = Jelly_GamePlayers(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "playerType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "perspective" }) {
            parameters.perspective = Jelly_RawgPerspective(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "perspective"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "worldTypes" }) {
            parameters.worldTypes = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "worldTypes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scoreAbove" }) {
            parameters.scoreAbove = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "scoreAbove"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "subtitleType" }) {
            parameters.subtitleType = Jelly_GameSubtitleType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "subtitleType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "excludeAdditions" }) {
            parameters.excludeAdditions = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "excludeAdditions"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortOrder" }) {
            parameters.sortOrder = Jelly_RawgSortOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "sortOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "descendingOrder" }) {
            parameters.descendingOrder = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "descendingOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "afterYear" }) {
            parameters.afterYear = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "afterYear"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "beforeYear" }) {
            parameters.beforeYear = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "beforeYear"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "renderThumbnails" }) {
            parameters.renderThumbnails = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "renderThumbnails"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultCount" }) {
            parameters.resultCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findGamesRawg", name: "resultCount"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "Space",
			"queryMatching": "fuzzy",
			"platforms": "PC",
			"genres": "Action",
			"stores": "Steam",
			"playerType": "all",
			"perspective": "none",
			"worldTypes": "Aliens",
			"scoreAbove": "75",
			"subtitleType": "platforms",
			"excludeAdditions": "false",
			"sortOrder": "name",
			"descendingOrder": "true",
			"afterYear": "2010",
			"beforeYear": "",
			"renderThumbnails": "true",
			"resultCount": "20",

        ]
    }
}