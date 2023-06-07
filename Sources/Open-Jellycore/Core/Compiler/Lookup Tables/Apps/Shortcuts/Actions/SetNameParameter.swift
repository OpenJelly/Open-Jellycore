//
//  SetNameParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetNameParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFName: JellyString?
	var WFDontIncludeFileExtension: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetNameParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setName", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setName", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dontIncludeExtension" }) {
            parameters.WFDontIncludeFileExtension = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setName", name: "dontIncludeExtension"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "Clipboard",
			"name": "ClipboardCopy",
			"dontIncludeExtension": "false",

        ]
    }
}