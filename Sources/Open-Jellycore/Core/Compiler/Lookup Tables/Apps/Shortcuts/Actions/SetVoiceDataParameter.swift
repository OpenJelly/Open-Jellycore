//
//  SetVoiceDataParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetVoiceDataParameter: ParameterProtocol, Codable {
	var mode: Jelly_RatMode?
	var sim: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetVoiceDataParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_RatMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setVoiceData", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sim" }) {
            parameters.sim = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setVoiceData", name: "sim"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "4G",
			"sim": "Primary",

        ]
    }
}