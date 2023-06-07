//
//  FormatCurrencyParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatCurrencyParameter: ParameterProtocol, Codable {
	var amount: JellyDouble?
	var currencyCode: JellyString?
	var roundTo: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatCurrencyParameter()

        if let value = call.first(where: { node in return node.slotName == "amount" }) {
            parameters.amount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatCurrency", name: "amount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "currencyCode" }) {
            parameters.currencyCode = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatCurrency", name: "currencyCode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundTo" }) {
            parameters.roundTo = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatCurrency", name: "roundTo"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"amount": "42120",
			"currencyCode": "GBP",
			"roundTo": "2",

        ]
    }
}
