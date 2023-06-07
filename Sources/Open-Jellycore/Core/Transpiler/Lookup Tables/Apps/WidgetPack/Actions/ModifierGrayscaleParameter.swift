//
//  ModifierGrayscaleParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierGrayscaleParameter: ParameterProtocol, Codable {
	var grayscale: JellyDouble?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierGrayscaleParameter()

        if let value = call.first(where: { node in return node.slotName == "grayscale" }) {
            parameters.grayscale = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierGrayscale", name: "grayscale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierGrayscale", name: "view"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"grayscale": "0.4",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
