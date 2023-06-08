//
//  ModifierFixedSizeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierFixedSizeParameter: ParameterProtocol, Codable {
	var fixedSizeHorizontal: JellyBoolean?
	var fixedSizeVertical: JellyBoolean?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierFixedSizeParameter()

        if let value = call.first(where: { node in return node.slotName == "fixedSizeHorizontal" }) {
            parameters.fixedSizeHorizontal = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedSize", name: "fixedSizeHorizontal"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedSizeVertical" }) {
            parameters.fixedSizeVertical = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedSize", name: "fixedSizeVertical"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedSize", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"fixedSizeHorizontal": "true",
			"fixedSizeVertical": "true",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
