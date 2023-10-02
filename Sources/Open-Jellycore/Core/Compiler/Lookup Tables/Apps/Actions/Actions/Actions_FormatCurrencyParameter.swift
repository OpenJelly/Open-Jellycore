//
//  Actions_FormatCurrencyParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_FormatCurrencyParameter: ParameterProtocol, Codable {
	var amount: JellyDouble?
	var currency: Jelly_Currency?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_FormatCurrencyParameter()

        if let value = call.first(where: { node in return node.slotName == "amount" }) {
            parameters.amount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatCurrency", name: "amount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "currency" }) {
            parameters.currency = Jelly_Currency(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatCurrency", name: "currency"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"amount": "104021",
			"currency": "Currency(identifier: \"USD\", displayString: \"USD — US Dollar\", code: \"USD\"",

        ]
    }
}
