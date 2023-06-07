//
//  CheckIfValueExistsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CheckIfValueExistsParameter: ParameterProtocol, Codable {
	var keyPath: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CheckIfValueExistsParameter()

        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "checkIfValueExists", name: "keyPath"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"keyPath": "jsonFiles/",

        ]
    }
}