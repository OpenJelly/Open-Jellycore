//
//  GetKeysParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetKeysParameter: ParameterProtocol, Codable {
	var source: Jelly_GetKeysSource?
	var keyPath: JellyString?
	var errorWhenValueNotFound: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetKeysParameter()

        if let value = call.first(where: { node in return node.slotName == "source" }) {
            parameters.source = Jelly_GetKeysSource(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getKeys", name: "source"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getKeys", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "errorWhenValueNotFound" }) {
            parameters.errorWhenValueNotFound = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getKeys", name: "errorWhenValueNotFound"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"source": "dictionary",
			"keyPath": "jsonFiles/",
			"errorWhenValueNotFound": "true",

        ]
    }
}
