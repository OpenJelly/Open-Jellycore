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
            parameters.WFItems = JellyDictionary(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "dictionary", name: "json"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"json": "{\"name\": \"Zachary\"}",

        ]
    }
}