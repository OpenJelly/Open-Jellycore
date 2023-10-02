//
//  GetChildCountParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetChildCountParameter: ParameterProtocol, Codable {
	var keyPath: JellyString?
	var errorWhenValueNotFound: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetChildCountParameter()

        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getChildCount", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "errorWhenValueNotFound" }) {
            parameters.errorWhenValueNotFound = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getChildCount", name: "errorWhenValueNotFound"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"keyPath": "jsonFiles/",
			"errorWhenValueNotFound": "false",

        ]
    }
}
