//
//  GetRSSItemsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetRSSItemsParameter: ParameterProtocol, Codable {
	var WFRSSFeedURL: JellyString?
	var WFRSSItemQuantity: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetRSSItemsParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFRSSFeedURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRSSItems", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFRSSItemQuantity = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRSSItems", name: "count"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://www.macstories.net/feed/",
			"count": "10",

        ]
    }
}