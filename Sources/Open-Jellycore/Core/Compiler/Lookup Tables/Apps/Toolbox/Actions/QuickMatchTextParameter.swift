//
//  QuickMatchTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QuickMatchTextParameter: ParameterProtocol, Codable {
	var sourceText: JellyString?
	var matchType: Jelly_RegexMatchType?
	var afterPattern: JellyString?
	var beforePattern: JellyString?
	var patternRangeStart: JellyString?
	var patternRangeEnd: JellyString?
	var caseSensitive: JellyBoolean?
	var inclusiveMatch: JellyBoolean?
	var matchNewLines: JellyBoolean?
	var matchOutput: Jelly_MatchOutput?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QuickMatchTextParameter()

        if let value = call.first(where: { node in return node.slotName == "sourceText" }) {
            parameters.sourceText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "sourceText"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "matchType" }) {
            parameters.matchType = Jelly_RegexMatchType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "matchType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "afterPattern" }) {
            parameters.afterPattern = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "afterPattern"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "beforePattern" }) {
            parameters.beforePattern = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "beforePattern"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "patternRangeStart" }) {
            parameters.patternRangeStart = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "patternRangeStart"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "patternRangeEnd" }) {
            parameters.patternRangeEnd = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "patternRangeEnd"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseSensitive" }) {
            parameters.caseSensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "caseSensitive"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "inclusiveMatch" }) {
            parameters.inclusiveMatch = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "inclusiveMatch"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "matchNewLines" }) {
            parameters.matchNewLines = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "matchNewLines"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "matchOutput" }) {
            parameters.matchOutput = Jelly_MatchOutput(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMatchText", name: "matchOutput"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"sourceText": "ShortcutInput",
			"matchType": "TextBetween",
			"afterPattern": "\"(\"",
			"beforePattern": "\")\"",
			"patternRangeStart": "\"\"",
			"patternRangeEnd": "\"\"",
			"caseSensitive": "true",
			"inclusiveMatch": "true",
			"matchNewLines": "true",
			"matchOutput": "AllMatches",

        ]
    }
}
