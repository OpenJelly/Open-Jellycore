//
//  Toolbox_PlayMusicParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Toolbox_PlayMusicParameter: ParameterProtocol, Codable {
	var ids: JellyArray<JellyVariableReference>?
	var repeatMode: Jelly_RepeatMode?
	var shuffle: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Toolbox_PlayMusicParameter()

        if let value = call.first(where: { node in return node.slotName == "ids" }) {
            parameters.ids = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "playMusic", name: "ids"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "repeatMode" }) {
            parameters.repeatMode = Jelly_RepeatMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "playMusic", name: "repeatMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shuffle" }) {
            parameters.shuffle = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "playMusic", name: "shuffle"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"ids": "[\"1564531202\", \"1558534271\"]",
			"repeatMode": "off",
			"shuffle": "false",

        ]
    }
}
