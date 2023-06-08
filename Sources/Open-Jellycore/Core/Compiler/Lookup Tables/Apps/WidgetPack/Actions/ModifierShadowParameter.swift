//
//  ModifierShadowParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierShadowParameter: ParameterProtocol, Codable {
	var view: Jelly_View?
	var color: Jelly_View?
	var radius: JellyDouble?
	var x: JellyDouble?
	var y: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierShadowParameter()

        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierShadow", name: "view"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "color" }) {
            parameters.color = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierShadow", name: "color"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "radius" }) {
            parameters.radius = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierShadow", name: "radius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "x" }) {
            parameters.x = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierShadow", name: "x"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "y" }) {
            parameters.y = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierShadow", name: "y"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"view": "View(identifier: \"View1\", displayString: \"View One\")",
			"color": "View(identifier: \"View2\", displayString: \"View Two\")",
			"radius": "10",
			"x": "0",
			"y": "0",

        ]
    }
}
