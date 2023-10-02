//
//  ConvertCurrencyParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ConvertCurrencyParameter: ParameterProtocol, Codable {
	var source: JellyString?
	var targets: JellyArray<JellyVariableReference>?
	var roundResult: JellyBoolean?
	var roundTo: JellyInteger?
	var amount: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ConvertCurrencyParameter()

        if let value = call.first(where: { node in return node.slotName == "source" }) {
            parameters.source = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "convertCurrency", name: "source"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "targets" }) {
            parameters.targets = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "convertCurrency", name: "targets"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundResult" }) {
            parameters.roundResult = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "convertCurrency", name: "roundResult"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundTo" }) {
            parameters.roundTo = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "convertCurrency", name: "roundTo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "amount" }) {
            parameters.amount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "convertCurrency", name: "amount"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"source": "🇺🇸 US Dollar",
			"targets": "🇦🇺 Australian Dollar",
			"roundResult": "true",
			"roundTo": "10",
			"amount": "1024",

        ]
    }
}
