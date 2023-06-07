//
//  RemoveEmojiParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveEmojiParameter: ParameterProtocol, Codable {
	var text: JellyArray<JellyVariableReference>?
	var replaceDoubleSpaces: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveEmojiParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeEmoji", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "replaceDoubleSpaces" }) {
            parameters.replaceDoubleSpaces = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeEmoji", name: "replaceDoubleSpaces"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "[\"Awesome ❗️\", \"Hey 👋\"]",
			"replaceDoubleSpaces": "true",

        ]
    }
}