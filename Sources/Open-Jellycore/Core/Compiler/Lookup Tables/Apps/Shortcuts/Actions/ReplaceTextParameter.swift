//
//  ReplaceTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ReplaceTextParameter: ParameterProtocol, Codable {
	var WFInput: JellyString?
	var WFReplaceTextFind: JellyString?
	var WFReplaceTextReplace: JellyString?
	var WFReplaceTextRegularExpression: JellyBoolean?
	var WFReplaceTextCaseSensitive: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ReplaceTextParameter()

        if let value = call.first(where: { node in return node.slotName == "input" }) {
            parameters.WFInput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "replaceText", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "find" }) {
            parameters.WFReplaceTextFind = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "replaceText", name: "find"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "replace" }) {
            parameters.WFReplaceTextReplace = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "replaceText", name: "replace"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isRegex" }) {
            parameters.WFReplaceTextRegularExpression = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "replaceText", name: "isRegex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseSensitive" }) {
            parameters.WFReplaceTextCaseSensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "replaceText", name: "caseSensitive"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "Hello World!",
			"find": "Hello",
			"replace": "Hey",
			"isRegex": "false",
			"caseSensitive": "true",

        ]
    }
}
