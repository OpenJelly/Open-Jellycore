//
//  MathParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MathParameter: ParameterProtocol, Codable {
	var WFInput: JellyArray<JellyString>?
	var WFMathOperation: Jelly_WFMathOperation?
	var WFMathOperand: JellyArray<JellyString>?
	var scientific: Jelly_WFScientificMathOperation?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MathParameter()

        if let value = call.first(where: { node in return node.slotName == "input" }) {
            parameters.WFInput = JellyArray<JellyString>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "math", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.WFMathOperation = Jelly_WFMathOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "math", name: "operation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "operand" }) {
            parameters.WFMathOperand = JellyArray<JellyString>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "math", name: "operand"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scientific" }) {
            parameters.scientific = Jelly_WFScientificMathOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "math", name: "scientific"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "10",
			"operation": "…",
			"operand": "42",
			"scientific": "x^y",

        ]
    }
}