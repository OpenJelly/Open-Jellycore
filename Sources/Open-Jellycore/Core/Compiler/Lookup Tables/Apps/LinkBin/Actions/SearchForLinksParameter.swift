//
//  SearchForLinksParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SearchForLinksParameter: ParameterProtocol, Codable {
	var searchText: JellyString?
	var includeArchivedLinks: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SearchForLinksParameter()

        if let value = call.first(where: { node in return node.slotName == "searchText" }) {
            parameters.searchText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchForLinks", name: "searchText"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeArchivedLinks" }) {
            parameters.includeArchivedLinks = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchForLinks", name: "includeArchivedLinks"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"searchText": "New Apps",
			"includeArchivedLinks": "false",

        ]
    }
}