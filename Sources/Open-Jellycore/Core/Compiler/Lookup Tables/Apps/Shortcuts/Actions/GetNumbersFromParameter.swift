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
            EventReporter.shared.reportError(error: .missingParameter(function: "getNumbersFrom", name: "text"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "My favorite number is 42",

        ]
    }
}
