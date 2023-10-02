//
//  SpellOutNumberParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SpellOutNumberParameter: ParameterProtocol, Codable {
	var number: JellyInteger?
	var ActionsLocale: Jelly_ActionsLocale?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SpellOutNumberParameter()

        if let value = call.first(where: { node in return node.slotName == "number" }) {
            parameters.number = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "spellOutNumber", name: "number"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "ActionsLocale" }) {
            parameters.ActionsLocale = Jelly_ActionsLocale(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "spellOutNumber", name: "ActionsLocale"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"number": "123",
			"ActionsLocale": "ActionsLocale(identifier: \"en_US_POSIX\", displayString: \"en_US_POSIX\")",

        ]
    }
}
