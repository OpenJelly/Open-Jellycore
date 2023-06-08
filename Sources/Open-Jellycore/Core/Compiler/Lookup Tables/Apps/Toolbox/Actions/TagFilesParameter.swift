//
//  TagFilesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TagFilesParameter: ParameterProtocol, Codable {
	var files: JellyVariableReference?
	var mode: Jelly_TagMode?
	var removeTags: JellyArray<JellyVariableReference>?
	var addTags: JellyArray<JellyVariableReference>?
	var appendTags: JellyArray<JellyVariableReference>?
	var caseSensitive: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TagFilesParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "files" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.files = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "tagFiles", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_TagMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "tagFiles", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeTags" }) {
            parameters.removeTags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "tagFiles", name: "removeTags"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addTags" }) {
            parameters.addTags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "tagFiles", name: "addTags"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "appendTags" }) {
            parameters.appendTags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "tagFiles", name: "appendTags"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseSensitive" }) {
            parameters.caseSensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "tagFiles", name: "caseSensitive"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "ShortcutInput",
			"mode": "set",
			"removeTags": "",
			"addTags": "[\"Red\", \"Green\"]",
			"appendTags": "",
			"caseSensitive": "true",

        ]
    }
}