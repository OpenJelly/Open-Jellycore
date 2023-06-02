//
//  DictionaryParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DictionaryParameter: ParameterProtocol, Codable {
	var WFItems: JellyDictionary?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DictionaryParameter()

        if let value = call.first(where: { node in return node.slotName == "json" }) {
            parameters.WFItems = JellyDictionary(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "dictionary", name: "json"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"json": "{\"name\": \"Zachary\"}",

        ]
    }
}