//
//  ModifierForegroundColorParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierForegroundColorParameter: ParameterProtocol, Codable {
	var foregroundColor: Jelly_View?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierForegroundColorParameter()

        if let value = call.first(where: { node in return node.slotName == "foregroundColor" }) {
            parameters.foregroundColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierForegroundColor", name: "foregroundColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierForegroundColor", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"foregroundColor": "View(identifier: \"View1\", displayString: \"View One\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
