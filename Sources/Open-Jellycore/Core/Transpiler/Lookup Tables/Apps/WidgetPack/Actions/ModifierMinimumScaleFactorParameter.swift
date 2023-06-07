//
//  ModifierMinimumScaleFactorParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierMinimumScaleFactorParameter: ParameterProtocol, Codable {
	var minimumScaleFactor: JellyDouble?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierMinimumScaleFactorParameter()

        if let value = call.first(where: { node in return node.slotName == "minimumScaleFactor" }) {
            parameters.minimumScaleFactor = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierMinimumScaleFactor", name: "minimumScaleFactor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierMinimumScaleFactor", name: "view"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"minimumScaleFactor": "0.4",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
