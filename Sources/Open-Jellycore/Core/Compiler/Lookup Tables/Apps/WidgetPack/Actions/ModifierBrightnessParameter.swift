//
//  ModifierBrightnessParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierBrightnessParameter: ParameterProtocol, Codable {
	var brightness: JellyDouble?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierBrightnessParameter()

        if let value = call.first(where: { node in return node.slotName == "brightness" }) {
            parameters.brightness = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierBrightness", name: "brightness"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierBrightness", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"brightness": "0.5",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
