//
//  SaveFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SaveFileParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFAskWhereToSave: JellyBoolean?
	var WFFileDestinationPath: JellyString?
	var WFSaveFileOverwrite: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SaveFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "saveFile", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "ask" }) {
            parameters.WFAskWhereToSave = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "saveFile", name: "ask"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.WFFileDestinationPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "saveFile", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overwrite" }) {
            parameters.WFSaveFileOverwrite = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "saveFile", name: "overwrite"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"ask": "false",
			"path": "JellycutsHelper/${ShortcutInput}.txt",
			"overwrite": "true",

        ]
    }
}