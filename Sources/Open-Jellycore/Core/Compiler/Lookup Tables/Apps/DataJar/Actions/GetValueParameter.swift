//
//  GetValueParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetValueParameter: ParameterProtocol, Codable {
	var keyPath: JellyString?
	var fallbackValues: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetValueParameter()

        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getValue", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fallbackValues" }) {
            parameters.fallbackValues = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getValue", name: "fallbackValues"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"keyPath": "count/",
			"fallbackValues": "[count]",

        ]
    }
}