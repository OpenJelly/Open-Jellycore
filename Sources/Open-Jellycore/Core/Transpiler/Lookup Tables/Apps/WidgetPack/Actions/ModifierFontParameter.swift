//
//  ModifierFontParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierFontParameter: ParameterProtocol, Codable {
	var font: Jelly_Font?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierFontParameter()

        if let value = call.first(where: { node in return node.slotName == "font" }) {
            parameters.font = Jelly_Font(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFont", name: "font"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFont", name: "view"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"font": "Font(identifier: \"SF Pro\", displayString: \"SF Pro\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
