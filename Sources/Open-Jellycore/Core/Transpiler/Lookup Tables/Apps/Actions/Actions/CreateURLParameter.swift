//
//  CreateURLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateURLParameter: ParameterProtocol, Codable {
	var scheme: JellyString?
	var host: JellyString?
	var path: JellyString?
	var queryItems: JellyArray<JellyVariableReference>?
	var fragment: JellyString?
	var user: JellyString?
	var password: JellyString?
	var useCustomPort: JellyBoolean?
	var port: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateURLParameter()

        if let value = call.first(where: { node in return node.slotName == "scheme" }) {
            parameters.scheme = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "scheme"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "host" }) {
            parameters.host = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "host"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.path = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryItems" }) {
            parameters.queryItems = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "queryItems"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fragment" }) {
            parameters.fragment = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "fragment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "user" }) {
            parameters.user = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "user"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "password" }) {
            parameters.password = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "password"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useCustomPort" }) {
            parameters.useCustomPort = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "useCustomPort"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "port" }) {
            parameters.port = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createURL", name: "port"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"scheme": "https",
			"host": "blog.actuallyzach.com",
			"path": "\"/\"",
			"queryItems": "[]",
			"fragment": "\"\"",
			"user": "\"\"",
			"password": "\"\"",
			"useCustomPort": "true",
			"port": "42",

        ]
    }
}