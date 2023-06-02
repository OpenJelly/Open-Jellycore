//
//  SearchPodcastsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SearchPodcastsParameter: ParameterProtocol, Codable {
	var WFSearchTerm: JellyString?
	var by: Jelly_WFAttribute?
	var results: Jelly_WFEntity?
	var country: Jelly_WFCountry?
	var WFItemLimit: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SearchPodcastsParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.WFSearchTerm = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchPodcasts", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "by" }) {
            parameters.by = Jelly_WFAttribute(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchPodcasts", name: "by"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "results" }) {
            parameters.results = Jelly_WFEntity(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchPodcasts", name: "results"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "country" }) {
            parameters.country = Jelly_WFCountry(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchPodcasts", name: "country"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "items" }) {
            parameters.WFItemLimit = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchPodcasts", name: "items"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "ATP",
			"by": "All",
			"results": "iPhone",
			"country": "United States",
			"items": "1",

        ]
    }
}