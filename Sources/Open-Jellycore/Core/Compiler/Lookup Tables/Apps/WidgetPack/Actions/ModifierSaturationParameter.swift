//
//  ModifierSaturationParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierSaturationParameter: ParameterProtocol, Codable {
	var saturation: JellyDouble?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierSaturationParameter()

        if let value = call.first(where: { node in return node.slotName == "saturation" }) {
            parameters.saturation = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierSaturation", name: "saturation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierSaturation", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"saturation": "0.2",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
