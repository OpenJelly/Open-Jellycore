//
//  ModifierRotationParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierRotationParameter: ParameterProtocol, Codable {
	var view: Jelly_View?
	var angle: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierRotationParameter()

        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRotation", name: "view"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "angle" }) {
            parameters.angle = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRotation", name: "angle"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"view": "View(identifier: \"View1\", displayString: \"View One\")",
			"angle": "213.3",

        ]
    }
}
