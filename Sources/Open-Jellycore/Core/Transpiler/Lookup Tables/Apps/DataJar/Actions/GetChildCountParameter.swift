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
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getChildCount", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "errorWhenValueNotFound" }) {
            parameters.errorWhenValueNotFound = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getChildCount", name: "errorWhenValueNotFound"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"keyPath": "jsonFiles/",
			"errorWhenValueNotFound": "false",

        ]
    }
}