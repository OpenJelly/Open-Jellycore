//
//  GetNumbersFromParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetNumbersFromParameter: ParameterProtocol, Codable {
	var WFInput: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetNumbersFromParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFInput = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getNumbersFrom", name: "text"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "My favorite number is 42",

        ]
    }
}