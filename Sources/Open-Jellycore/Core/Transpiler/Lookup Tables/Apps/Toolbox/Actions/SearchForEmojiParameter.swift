//
//  SearchForEmojiParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SearchForEmojiParameter: ParameterProtocol, Codable {
	var query: JellyString?
	var category: Jelly_EmojiCategories?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SearchForEmojiParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchForEmoji", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "category" }) {
            parameters.category = Jelly_EmojiCategories(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchForEmoji", name: "category"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchForEmoji", name: "limit"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "\"Dragon\"",
			"category": "Abstract",
			"limit": "5",

        ]
    }
}