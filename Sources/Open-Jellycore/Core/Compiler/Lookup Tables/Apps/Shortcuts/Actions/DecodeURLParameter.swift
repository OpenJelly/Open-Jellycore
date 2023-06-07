//
//  DecodeURLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DecodeURLParameter: ParameterProtocol, Codable {
	var WFInput: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DecodeURLParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFInput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "decodeURL", name: "url"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "Hello%20World",

        ]
    }
}