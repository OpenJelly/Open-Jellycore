//
//  BuildURLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct BuildURLParameter: ParameterProtocol, Codable {
	var scheme: JellyString?
	var host: JellyString?
	var path: JellyString?
	var queryItems: JellyArray<Jelly_QueryItemType>?
	var user: JellyString?
	var password: JellyString?
	var fragment: JellyString?
	var addPort: JellyBoolean?
	var port: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = BuildURLParameter()

        if let value = call.first(where: { node in return node.slotName == "scheme" }) {
            parameters.scheme = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "scheme"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "host" }) {
            parameters.host = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "host"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.path = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryItems" }) {
            parameters.queryItems = JellyArray<Jelly_QueryItemType>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "queryItems"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "user" }) {
            parameters.user = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "user"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "password" }) {
            parameters.password = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "password"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fragment" }) {
            parameters.fragment = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "fragment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addPort" }) {
            parameters.addPort = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "addPort"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "port" }) {
            parameters.port = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "buildURL", name: "port"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"scheme": "https",
			"host": "blog.actuallyzach.com",
			"path": "",
			"queryItems": "",
			"user": "",
			"password": "",
			"fragment": "",
			"addPort": "",
			"port": "",

        ]
    }
}
