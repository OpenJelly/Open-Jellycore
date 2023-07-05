//
//  ParseCSVParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ParseCSVParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var hasHeader: JellyBoolean?
	var fields: JellyArray<JellyVariableReference>?
	var delimiter: Jelly_ParseCSVDelimiter?
	var customDelimiter: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ParseCSVParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parseCSV", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hasHeader" }) {
            parameters.hasHeader = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parseCSV", name: "hasHeader"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fields" }) {
            parameters.fields = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parseCSV", name: "fields"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "delimiter" }) {
            parameters.delimiter = Jelly_ParseCSVDelimiter(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parseCSV", name: "delimiter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customDelimiter" }) {
            parameters.customDelimiter = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parseCSV", name: "customDelimiter"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",
			"hasHeader": "true",
			"fields": "[\"Input\", \"Clipboard\"]",
			"delimiter": "detect",
			"customDelimiter": "-",

        ]
    }
}