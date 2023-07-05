//
//  FilterDictionariesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FilterDictionariesParameter: ParameterProtocol, Codable {
	var dictionaries: JellyVariableReference?
	var key: JellyString?
	var operation: Jelly_FilterDictionariesOperation?
	var isValue: JellyString?
	var isNotValue: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FilterDictionariesParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "dictionaries" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.dictionaries = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterDictionaries", name: "dictionaries"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "key" }) {
            parameters.key = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterDictionaries", name: "key"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_FilterDictionariesOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterDictionaries", name: "operation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isValue" }) {
            parameters.isValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterDictionaries", name: "isValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isNotValue" }) {
            parameters.isNotValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterDictionaries", name: "isNotValue"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"dictionaries": "ShortcutInput",
			"key": "name",
			"operation": "is",
			"isValue": "Zachary Lineman",
			"isNotValue": "\"\"",

        ]
    }
}