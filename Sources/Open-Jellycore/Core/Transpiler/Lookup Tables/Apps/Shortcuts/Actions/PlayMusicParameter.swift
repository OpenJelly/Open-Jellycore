//
//  PlayMusicParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PlayMusicParameter: ParameterProtocol, Codable {
	var WFMediaItems: JellyVariableReference?
	var shuffle: Jelly_WFPlayMusicActionShuffle?
	var `repeat`: Jelly_WFPlayMusicActionRepeat?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PlayMusicParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "music" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFMediaItems = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "playMusic", name: "music"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shuffle" }) {
            parameters.shuffle = Jelly_WFPlayMusicActionShuffle(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "playMusic", name: "shuffle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "repeat" }) {
            parameters.repeat = Jelly_WFPlayMusicActionRepeat(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "playMusic", name: "repeat"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"music": "ShortcutInput",
			"shuffle": "Songs",
			"repeat": "One",

        ]
    }
}
