//
//  ListFeedsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ListFeedsParameter: ParameterProtocol, Codable {
	var folderName: JellyString?
	var limit: JellyInteger?
	var offset: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ListFeedsParameter()

        if let value = call.first(where: { node in return node.slotName == "folderName" }) {
            parameters.folderName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listFeeds", name: "folderName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listFeeds", name: "limit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "offset" }) {
            parameters.offset = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "listFeeds", name: "offset"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"folderName": "iOS Reviews",
			"limit": "5",
			"offset": "0",

        ]
    }
}