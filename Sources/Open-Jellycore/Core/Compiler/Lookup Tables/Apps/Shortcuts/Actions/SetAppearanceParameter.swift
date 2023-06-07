//
//  SetAppearanceParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetAppearanceParameter: ParameterProtocol, Codable {
	var style: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetAppearanceParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.style = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setAppearance", name: "mode"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "Device Name",

        ]
    }
}