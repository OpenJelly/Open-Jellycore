//
//  RandomNumberParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RandomNumberParameter: ParameterProtocol, Codable {
	var WFRandomNumberMinimum: JellyDouble?
	var WFRandomNumberMaximum: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RandomNumberParameter()

        if let value = call.first(where: { node in return node.slotName == "min" }) {
            parameters.WFRandomNumberMinimum = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomNumber", name: "min"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "max" }) {
            parameters.WFRandomNumberMaximum = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomNumber", name: "max"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"min": "0",
			"max": "100",

        ]
    }
}