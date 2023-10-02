//
//  StockDetailParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct StockDetailParameter: ParameterProtocol, Codable {
	var detail: Jelly_WFContentItemPropertyName?
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = StockDetailParameter()

        if let value = call.first(where: { node in return node.slotName == "detail" }) {
            parameters.detail = Jelly_WFContentItemPropertyName(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stockDetail", name: "detail"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "stock" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stockDetail", name: "stock"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"detail": "price",
			"stock": "stock",

        ]
    }
}
