//
//  Actions_SortListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_SortListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var ascending: JellyBoolean?
	var sortType: Jelly_SortType_?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_SortListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sortList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "ascending" }) {
            parameters.ascending = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sortList", name: "ascending"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortType" }) {
            parameters.sortType = Jelly_SortType_(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sortList", name: "sortType"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[\"Awesome Item\", \"Awesome Item 2\"]",
			"ascending": "false",
			"sortType": "natural",

        ]
    }
}
