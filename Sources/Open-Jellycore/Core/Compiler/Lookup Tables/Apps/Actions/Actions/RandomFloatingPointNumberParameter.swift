//
//  RandomFloatingPointNumberParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RandomFloatingPointNumberParameter: ParameterProtocol, Codable {
	var minimum: JellyDouble?
	var maximum: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RandomFloatingPointNumberParameter()

        if let value = call.first(where: { node in return node.slotName == "minimum" }) {
            parameters.minimum = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "randomFloatingPointNumber", name: "minimum"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "maximum" }) {
            parameters.maximum = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "randomFloatingPointNumber", name: "maximum"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"minimum": "0",
			"maximum": "42",

        ]
    }
}
