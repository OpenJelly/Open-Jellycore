//
//  TrimTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TrimTextParameter: ParameterProtocol, Codable {
	var charCount: JellyInteger?
	var trimFrom: Jelly_TrimFrom?
	var sourceText: JellyString?
	var removeWhiteSpace: JellyBoolean?
	var removeNewLines: JellyBoolean?
	var emptyLineType: Jelly_EmptyLineType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TrimTextParameter()

        if let value = call.first(where: { node in return node.slotName == "charCount" }) {
            parameters.charCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "trimText", name: "charCount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "trimFrom" }) {
            parameters.trimFrom = Jelly_TrimFrom(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "trimText", name: "trimFrom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sourceText" }) {
            parameters.sourceText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "trimText", name: "sourceText"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeWhiteSpace" }) {
            parameters.removeWhiteSpace = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "trimText", name: "removeWhiteSpace"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeNewLines" }) {
            parameters.removeNewLines = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "trimText", name: "removeNewLines"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "emptyLineType" }) {
            parameters.emptyLineType = Jelly_EmptyLineType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "trimText", name: "emptyLineType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"charCount": "2",
			"trimFrom": "TrimFromStart",
			"sourceText": "ShortcutInput",
			"removeWhiteSpace": "true",
			"removeNewLines": "true",
			"emptyLineType": "all",

        ]
    }
}