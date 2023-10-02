//
//  CalculateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CalculateParameter: ParameterProtocol, Codable {
	var Input: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CalculateParameter()

        if let value = call.first(where: { node in return node.slotName == "input" }) {
            parameters.Input = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "calculate", name: "input"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "(123.4 * 42^42) * 3",

        ]
    }
}
