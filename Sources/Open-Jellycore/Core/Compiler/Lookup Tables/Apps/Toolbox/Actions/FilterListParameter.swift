//
//  FilterListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FilterListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var criteria: JellyString?
	var keepOrDiscard: Jelly_KeepDiscard?
	var discardEmpty: JellyBoolean?
	var isCaseSensitive: JellyBoolean?
	var limitResults: JellyBoolean?
	var resultCount: JellyInteger?
	var mode: Jelly_FilterListMode?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FilterListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "criteria" }) {
            parameters.criteria = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "criteria"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keepOrDiscard" }) {
            parameters.keepOrDiscard = Jelly_KeepDiscard(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "keepOrDiscard"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "discardEmpty" }) {
            parameters.discardEmpty = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "discardEmpty"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isCaseSensitive" }) {
            parameters.isCaseSensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "isCaseSensitive"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitResults" }) {
            parameters.limitResults = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "limitResults"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultCount" }) {
            parameters.resultCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "resultCount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_FilterListMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "filterList", name: "mode"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "ShortcutInput",
			"criteria": "Jellycuts",
			"keepOrDiscard": "keep",
			"discardEmpty": "true",
			"isCaseSensitive": "true",
			"limitResults": "true",
			"resultCount": "5",
			"mode": "starting",

        ]
    }
}
