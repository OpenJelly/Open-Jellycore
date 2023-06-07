//
//  GetLocationFromW3WParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLocationFromW3WParameter: ParameterProtocol, Codable {
	var what3words: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLocationFromW3WParameter()

        if let value = call.first(where: { node in return node.slotName == "what3words" }) {
            parameters.what3words = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getLocationFromW3W", name: "what3words"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"what3words": "garden.scores.spirit",

        ]
    }
}