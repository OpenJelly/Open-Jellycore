//
//  GetAudioParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetAudioParameter: ParameterProtocol, Codable {
	var systemSounds: Jelly_SystemSounds?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetAudioParameter()

        if let value = call.first(where: { node in return node.slotName == "systemSounds" }) {
            parameters.systemSounds = Jelly_SystemSounds(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getAudio", name: "systemSounds"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"systemSounds": "tink",

        ]
    }
}