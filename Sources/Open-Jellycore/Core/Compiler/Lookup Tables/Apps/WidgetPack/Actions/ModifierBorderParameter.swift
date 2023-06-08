//
//  ModifierBorderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierBorderParameter: ParameterProtocol, Codable {
	var view: Jelly_View?
	var content: Jelly_View?
	var width: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierBorderParameter()

        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierBorder", name: "view"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "content" }) {
            parameters.content = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierBorder", name: "content"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.width = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierBorder", name: "width"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"view": "View(identifier: \"View1\", displayString: \"View One\")",
			"content": "View(identifier: \"View1\", displayString: \"View One\")",
			"width": "34.3",

        ]
    }
}
