//
//  QuickMenuLegacyParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QuickMenuLegacyParameter: ParameterProtocol, Codable {
	var text: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QuickMenuLegacyParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quickMenuLegacy", name: "text"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "\"A really quick menu\"",

        ]
    }
}
