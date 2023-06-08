//
//  GenerateCSVParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GenerateCSVParameter: ParameterProtocol, Codable {
	var rows: JellyVariableReference?
	var allFields: JellyBoolean?
	var fields: JellyArray<JellyVariableReference>?
	var delimiter: Jelly_CSVDelimiter?
	var customDelimiter: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GenerateCSVParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "rows" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.rows = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateCSV", name: "rows"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "allFields" }) {
            parameters.allFields = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateCSV", name: "allFields"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fields" }) {
            parameters.fields = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateCSV", name: "fields"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "delimiter" }) {
            parameters.delimiter = Jelly_CSVDelimiter(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateCSV", name: "delimiter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customDelimiter" }) {
            parameters.customDelimiter = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateCSV", name: "customDelimiter"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"rows": "[ShortcutInput, Clipboard]",
			"allFields": "true",
			"fields": "[\"Input\", \"Clipboard\"]",
			"delimiter": "custom",
			"customDelimiter": "-",

        ]
    }
}