//
//  RunCodeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunCodeParameter: ParameterProtocol, Codable {
	var code: JellyString?
	var arguments: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunCodeParameter()

        if let value = call.first(where: { node in return node.slotName == "code" }) {
            parameters.code = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runCode", name: "code"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "arguments" }) {
            parameters.arguments = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runCode", name: "arguments"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"code": "puts \\\"Hello World\\\"",
			"arguments": "[]",

        ]
    }
}
