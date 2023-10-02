//
//  SetTimerVolumeLevelParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetTimerVolumeLevelParameter: ParameterProtocol, Codable {
	var volume: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetTimerVolumeLevelParameter()

        if let value = call.first(where: { node in return node.slotName == "volume" }) {
            parameters.volume = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setTimerVolumeLevel", name: "volume"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"volume": "0.5",

        ]
    }
}
