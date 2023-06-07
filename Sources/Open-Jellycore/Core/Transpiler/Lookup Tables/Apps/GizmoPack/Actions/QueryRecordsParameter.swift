//
//  QueryRecordsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QueryRecordsParameter: ParameterProtocol, Codable {
	var fields: JellyArray<JellyVariableReference>?
	var input: JellyVariableReference?
	var outputType: Jelly_QueryRecordsOutput?
	var hasWhere: JellyBoolean?
	var whereClause: JellyString?
	var hasGroupBy: JellyBoolean?
	var groupByClause: JellyArray<JellyVariableReference>?
	var hasOrderBy: JellyBoolean?
	var orderByClause: JellyArray<JellyVariableReference>?
	var hasLimit: JellyBoolean?
	var limitClause: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QueryRecordsParameter()

        if let value = call.first(where: { node in return node.slotName == "fields" }) {
            parameters.fields = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "fields"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "input" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "outputType" }) {
            parameters.outputType = Jelly_QueryRecordsOutput(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "outputType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hasWhere" }) {
            parameters.hasWhere = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "hasWhere"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "whereClause" }) {
            parameters.whereClause = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "whereClause"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hasGroupBy" }) {
            parameters.hasGroupBy = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "hasGroupBy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "groupByClause" }) {
            parameters.groupByClause = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "groupByClause"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hasOrderBy" }) {
            parameters.hasOrderBy = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "hasOrderBy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "orderByClause" }) {
            parameters.orderByClause = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "orderByClause"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hasLimit" }) {
            parameters.hasLimit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "hasLimit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitClause" }) {
            parameters.limitClause = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryRecords", name: "limitClause"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"fields": "[\"${ShortcutInput}\", \"${Clipboard}\"]",
			"input": "ShortcutInput",
			"outputType": "automatic",
			"hasWhere": "false",
			"whereClause": "\"\"",
			"hasGroupBy": "false",
			"groupByClause": "\"\"",
			"hasOrderBy": "false",
			"orderByClause": "\"\"",
			"hasLimit": "false",
			"limitClause": "\"\"",

        ]
    }
}