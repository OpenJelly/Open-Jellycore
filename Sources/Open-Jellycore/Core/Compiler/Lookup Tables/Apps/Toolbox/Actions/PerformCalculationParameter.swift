//
//  PerformCalculationParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PerformCalculationParameter: ParameterProtocol, Codable {
	var expression: JellyString?
	var roundResult: JellyBoolean?
	var decimalPlaces: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PerformCalculationParameter()

        if let value = call.first(where: { node in return node.slotName == "expression" }) {
            parameters.expression = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "performCalculation", name: "expression"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundResult" }) {
            parameters.roundResult = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "performCalculation", name: "roundResult"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "decimalPlaces" }) {
            parameters.decimalPlaces = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "performCalculation", name: "decimalPlaces"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"expression": "\"10 + 10\"",
			"roundResult": "true",
			"decimalPlaces": "1",

        ]
    }
}
