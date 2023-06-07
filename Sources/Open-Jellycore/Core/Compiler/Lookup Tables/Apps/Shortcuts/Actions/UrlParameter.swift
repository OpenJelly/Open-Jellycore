//
//  UrlParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UrlParameter: ParameterProtocol, Codable {
	var WFURLActionURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UrlParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFURLActionURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "url", name: "url"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycut.com",

        ]
    }
}