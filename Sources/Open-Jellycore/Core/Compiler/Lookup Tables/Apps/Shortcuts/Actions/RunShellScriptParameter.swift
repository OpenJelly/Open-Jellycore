//
//  RunShellScriptParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunShellScriptParameter: ParameterProtocol, Codable {
	var Input: JellyVariableReference?
	var Script: JellyString?
	var shell: Jelly_Shell?
	var inputMode: Jelly_InputMode?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunShellScriptParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.Input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShellScript", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "script" }) {
            parameters.Script = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShellScript", name: "script"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shell" }) {
            parameters.shell = Jelly_Shell(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShellScript", name: "shell"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "inputMode" }) {
            parameters.inputMode = Jelly_InputMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runShellScript", name: "inputMode"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"script": "echo \"Hello World\"",
			"shell": "/bin/zsh",
			"inputMode": "as arguments",

        ]
    }
}