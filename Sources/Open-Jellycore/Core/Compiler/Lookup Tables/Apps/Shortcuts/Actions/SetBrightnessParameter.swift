//
//  SetBrightnessParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetBrightnessParameter: ParameterProtocol, Codable {
	var WFBrightness: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetBrightnessParameter()

        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.WFBrightness = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setBrightness", name: "value"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"value": "0.8",

        ]
    }
}
