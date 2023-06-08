//
//  TranslateTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TranslateTextParameter: ParameterProtocol, Codable {
	var WFInputText: JellyString?
	var from: Jelly_WFSelectedFromLanguage?
	var to: Jelly_WFSelectedLanguage?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TranslateTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFInputText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "translateText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "from" }) {
            parameters.from = Jelly_WFSelectedFromLanguage(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "translateText", name: "from"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "to" }) {
            parameters.to = Jelly_WFSelectedLanguage(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "translateText", name: "to"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello World",
			"from": "English",
			"to": "Japanese",

        ]
    }
}