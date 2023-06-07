//
//  SortDictionariesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SortDictionariesParameter: ParameterProtocol, Codable {
	var dictionaries: JellyArray<JellyVariableReference>?
	var sortKey: JellyString?
	var sortOrder: Jelly_AlbumSortOrder?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SortDictionariesParameter()

        if let value = call.first(where: { node in return node.slotName == "dictionaries" }) {
            parameters.dictionaries = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sortDictionaries", name: "dictionaries"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortKey" }) {
            parameters.sortKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sortDictionaries", name: "sortKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortOrder" }) {
            parameters.sortOrder = Jelly_AlbumSortOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sortDictionaries", name: "sortOrder"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"dictionaries": "[ShortcutInput]",
			"sortKey": "Date",
			"sortOrder": "Ascending",

        ]
    }
}