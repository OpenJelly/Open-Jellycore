//
//  CorrectSpellingParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CorrectSpellingParameter: ParameterProtocol, Codable {
	var text: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CorrectSpellingParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "correctSpelling", name: "text"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello World!",

        ]
    }
}
