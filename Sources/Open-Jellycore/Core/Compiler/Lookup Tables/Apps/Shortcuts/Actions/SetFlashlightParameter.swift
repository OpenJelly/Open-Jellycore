//
//  SetFlashlightParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetFlashlightParameter: ParameterProtocol, Codable {
	var state: JellyIntegerBoolean?
	var WFFlashlightLevel: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetFlashlightParameter()

        if let value = call.first(where: { node in return node.slotName == "state" }) {
            parameters.state = JellyIntegerBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setFlashlight", name: "state"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "level" }) {
            parameters.WFFlashlightLevel = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setFlashlight", name: "level"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"state": "true",
			"level": "0.8",

        ]
    }
}