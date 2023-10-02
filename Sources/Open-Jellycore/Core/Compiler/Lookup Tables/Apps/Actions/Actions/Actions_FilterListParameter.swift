//
//  Actions_FilterListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_FilterListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var shouldKeep: JellyBoolean?
	var condition: Jelly_FilterCondition?
	var matchText: JellyString?
	var caseSensitive: JellyBoolean?
	var shouldLimit: JellyBoolean?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_FilterListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shouldKeep" }) {
            parameters.shouldKeep = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "shouldKeep"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "condition" }) {
            parameters.condition = Jelly_FilterCondition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "condition"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "matchText" }) {
            parameters.matchText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "matchText"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseSensitive" }) {
            parameters.caseSensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "caseSensitive"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shouldLimit" }) {
            parameters.shouldLimit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "shouldLimit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "limit"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[\"Awesome Item\", \"Awesome Item\", \"Awes0me Item 2\"]",
			"shouldKeep": "false",
			"condition": "contains",
			"matchText": "Awesome",
			"caseSensitive": "true",
			"shouldLimit": "true",
			"limit": "1",

        ]
    }
}
