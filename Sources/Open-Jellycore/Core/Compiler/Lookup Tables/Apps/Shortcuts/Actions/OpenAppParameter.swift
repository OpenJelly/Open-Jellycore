//
//  OpenAppParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenAppParameter: ParameterProtocol, Codable {
	var WFAppIdentifier: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenAppParameter()

        if let value = call.first(where: { node in return node.slotName == "id" }) {
            parameters.WFAppIdentifier = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openApp", name: "id"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"id": "com.zlineman.jellyfish",

        ]
    }
}