//
//  SetDNDParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetDNDParameter: ParameterProtocol, Codable {
	var Enabled: JellyIntegerBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetDNDParameter()

        if let value = call.first(where: { node in return node.slotName == "state" }) {
            parameters.Enabled = JellyIntegerBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDND", name: "state"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"state": "false",

        ]
    }
}