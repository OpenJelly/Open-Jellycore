//
//  ClampNumberParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ClampNumberParameter: ParameterProtocol, Codable {
	var number: JellyDouble?
	var minimum: JellyDouble?
	var maximum: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ClampNumberParameter()

        if let value = call.first(where: { node in return node.slotName == "number" }) {
            parameters.number = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "clampNumber", name: "number"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "minimum" }) {
            parameters.minimum = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "clampNumber", name: "minimum"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "maximum" }) {
            parameters.maximum = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "clampNumber", name: "maximum"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"number": "ShortcutInput",
			"minimum": "40",
			"maximum": "42",

        ]
    }
}
