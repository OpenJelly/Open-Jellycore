//
//  aShell_ExecuteCommandParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct aShell_ExecuteCommandParameter: ParameterProtocol, Codable {
	var command: JellyArray<JellyVariableReference>?
	var openWindow: aShell_Jelly_Enum?
	var keepGoing: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = aShell_ExecuteCommandParameter()

        if let value = call.first(where: { node in return node.slotName == "command" }) {
            parameters.command = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "executeCommand", name: "command"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "openWindow" }) {
            parameters.openWindow = aShell_Jelly_Enum(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "executeCommand", name: "openWindow"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keepGoing" }) {
            parameters.keepGoing = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "executeCommand", name: "keepGoing"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"command": "help",
			"openWindow": "default",
			"keepGoing": "true",

        ]
    }
}
