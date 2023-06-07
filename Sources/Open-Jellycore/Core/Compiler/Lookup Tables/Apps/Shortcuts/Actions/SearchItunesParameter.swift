//
//  SearchItunesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SearchItunesParameter: ParameterProtocol, Codable {
	var WFSearchTerm: JellyString?
	var category: Jelly_WFMediaType?
	var by: Jelly_WFAttribute?
	var results: Jelly_WFEntity?
	var WFItemLimit: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SearchItunesParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.WFSearchTerm = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchItunes", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "category" }) {
            parameters.category = Jelly_WFMediaType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchItunes", name: "category"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "by" }) {
            parameters.by = Jelly_WFAttribute(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchItunes", name: "by"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "results" }) {
            parameters.results = Jelly_WFEntity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchItunes", name: "results"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFItemLimit = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchItunes", name: "count"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "Rick Astley",
			"category": "Music",
			"by": "All",
			"results": "Songs",
			"count": "5",

        ]
    }
}