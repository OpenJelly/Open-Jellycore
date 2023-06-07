//
//  AddExpenseParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddExpenseParameter: ParameterProtocol, Codable {
	var amount: JellyDouble?
	var tag: Jelly_NudgetTag?
	var memo: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddExpenseParameter()

        if let value = call.first(where: { node in return node.slotName == "amount" }) {
            parameters.amount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addExpense", name: "amount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tag" }) {
            parameters.tag = Jelly_NudgetTag(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addExpense", name: "tag"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "memo" }) {
            parameters.memo = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addExpense", name: "memo"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"amount": "42.42",
			"tag": "NudgetTag(identifier: \"42-867-5309\", \"Life\")",
			"memo": "A Car",

        ]
    }
}
