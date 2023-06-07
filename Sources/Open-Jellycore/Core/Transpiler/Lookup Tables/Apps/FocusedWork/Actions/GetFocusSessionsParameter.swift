//
//  GetFocusSessionsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFocusSessionsParameter: ParameterProtocol, Codable {
	var favouritesOnly: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFocusSessionsParameter()

        if let value = call.first(where: { node in return node.slotName == "favouritesOnly" }) {
            parameters.favouritesOnly = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFocusSessions", name: "favouritesOnly"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"favouritesOnly": "false",

        ]
    }
}