//
//  QueryJSONParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QueryJSONParameter: ParameterProtocol, Codable {
	var input: JellyVariableReference?
	var queryType: Jelly_JSONQueryType?
	var jsonPathQuery: JellyString?
	var jqQuery: JellyString?
	var slurp: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QueryJSONParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryJSON", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryType" }) {
            parameters.queryType = Jelly_JSONQueryType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryJSON", name: "queryType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "jsonPathQuery" }) {
            parameters.jsonPathQuery = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryJSON", name: "jsonPathQuery"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "jqQuery" }) {
            parameters.jqQuery = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryJSON", name: "jqQuery"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "slurp" }) {
            parameters.slurp = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryJSON", name: "slurp"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"queryType": "jsonPath",
			"jsonPathQuery": "\"objects/\"",
			"jqQuery": "\"\"",
			"slurp": "\"\"",

        ]
    }
}
