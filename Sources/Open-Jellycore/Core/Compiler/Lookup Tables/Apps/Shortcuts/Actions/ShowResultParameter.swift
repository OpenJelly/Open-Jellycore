//
//  ShowResultParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShowResultParameter: ParameterProtocol, Codable {
	var Text: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShowResultParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.Text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "showResult", name: "text"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello there General Kenobi",

        ]
    }
}