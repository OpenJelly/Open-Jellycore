//
//  CreateQueryItemParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateQueryItemParameter: ParameterProtocol, Codable {
	var inputType: Jelly_QueryItemType?
	var name: JellyString?
	var value: JellyString?
	var dictionary: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateQueryItemParameter()

        if let value = call.first(where: { node in return node.slotName == "inputType" }) {
            parameters.inputType = Jelly_QueryItemType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createQueryItem", name: "inputType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createQueryItem", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.value = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createQueryItem", name: "value"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dictionary" }) {
            parameters.dictionary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createQueryItem", name: "dictionary"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"inputType": "text",
			"name": "MyQuery",
			"value": "${ShortcutInput}",
			"dictionary": "${MyDictionary}",

        ]
    }
}