//
//  ModifierAccentColorParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierAccentColorParameter: ParameterProtocol, Codable {
	var accentColor: Jelly_View?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierAccentColorParameter()

        if let value = call.first(where: { node in return node.slotName == "accentColor" }) {
            parameters.accentColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierAccentColor", name: "accentColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierAccentColor", name: "view"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"accentColor": "View(identifier: \"View1\", displayString: \"View One\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
