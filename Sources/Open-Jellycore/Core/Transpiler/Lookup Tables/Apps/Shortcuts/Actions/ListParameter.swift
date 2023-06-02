//
//  ListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ListParameter: ParameterProtocol, Codable {
	var WFItems: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ListParameter()

        if let value = call.first(where: { node in return node.slotName == "items" }) {
            parameters.WFItems = JellyArray<JellyVariableReference>(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "list", name: "items"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"items": "[\"One\", \"Two\"]",

        ]
    }
}