//
//  StatisticParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct StatisticParameter: ParameterProtocol, Codable {
	var Input: JellyVariableReference?
	var operation: Jelly_WFStatisticsOperation?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = StatisticParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.Input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "statistic", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_WFStatisticsOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "statistic", name: "operation"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "Numbers",
			"operation": "Average",

        ]
    }
}
