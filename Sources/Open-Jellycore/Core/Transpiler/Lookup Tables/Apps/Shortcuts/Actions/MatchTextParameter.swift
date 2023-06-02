//
//  MatchTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MatchTextParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var WFMatchTextPattern: JellyString?
	var WFMatchTextCaseSensitive: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MatchTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "matchText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "regex" }) {
            parameters.WFMatchTextPattern = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "matchText", name: "regex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseSensitive" }) {
            parameters.WFMatchTextCaseSensitive = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "matchText", name: "caseSensitive"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello World!",
			"regex": "[a-z]!",
			"caseSensitive": "false",

        ]
    }
}