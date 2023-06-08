//
//  ModifierClipShapeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierClipShapeParameter: ParameterProtocol, Codable {
	var clipShape: Jelly_View?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierClipShapeParameter()

        if let value = call.first(where: { node in return node.slotName == "clipShape" }) {
            parameters.clipShape = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierClipShape", name: "clipShape"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierClipShape", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"clipShape": "View(identifier: \"View1\", displayString: \"View One\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
