//
//  AuthenticateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AuthenticateParameter: ParameterProtocol, Codable {
	var openURL: JellyBoolean?
	var postURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AuthenticateParameter()

        if let value = call.first(where: { node in return node.slotName == "openURL" }) {
            parameters.openURL = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "authenticate", name: "openURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "authenticate", name: "postURL"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"openURL": "true",
			"postURL": "shortcuts://",

        ]
    }
}