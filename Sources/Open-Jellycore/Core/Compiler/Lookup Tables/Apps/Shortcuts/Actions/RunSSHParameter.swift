//
//  RunSSHParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunSSHParameter: ParameterProtocol, Codable {
	var WFSSHHost: JellyString?
	var WFSSHPort: JellyString?
	var WFSSHUser: JellyString?
	var auth: Jelly_WFSSHAuthenticationType?
	var WFSSHPassword: JellyString?
	var WFInput: JellyVariableReference?
	var WFSSHScript: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunSSHParameter()

        if let value = call.first(where: { node in return node.slotName == "host" }) {
            parameters.WFSSHHost = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "host"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "port" }) {
            parameters.WFSSHPort = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "port"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "user" }) {
            parameters.WFSSHUser = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "user"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "auth" }) {
            parameters.auth = Jelly_WFSSHAuthenticationType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "auth"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "password" }) {
            parameters.WFSSHPassword = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "password"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "script" }) {
            parameters.WFSSHScript = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runSSH", name: "script"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"host": "pi_address",
			"port": "22",
			"user": "raspberry",
			"auth": "password",
			"password": "••••••••",
			"input": "ShortcutInput",
			"script": "Clipboard",

        ]
    }
}