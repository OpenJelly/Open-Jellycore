//
//  CalculateWithSoulverParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CalculateWithSoulverParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var roundResult: JellyBoolean?
	var roundTo: JellyInteger?
	var changeLocale: JellyBoolean?
	var locale: JellyString?
	var updateCurrencies: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CalculateWithSoulverParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculateWithSoulver", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundResult" }) {
            parameters.roundResult = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculateWithSoulver", name: "roundResult"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundTo" }) {
            parameters.roundTo = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculateWithSoulver", name: "roundTo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "changeLocale" }) {
            parameters.changeLocale = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculateWithSoulver", name: "changeLocale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "locale" }) {
            parameters.locale = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculateWithSoulver", name: "locale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "updateCurrencies" }) {
            parameters.updateCurrencies = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculateWithSoulver", name: "updateCurrencies"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "(x + 4^42) = y + 1",
			"roundResult": "true",
			"roundTo": "2",
			"changeLocale": "false",
			"locale": "",
			"updateCurrencies": "",

        ]
    }
}
