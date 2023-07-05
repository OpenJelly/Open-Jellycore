//
//  GetTimeBetweenParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetTimeBetweenParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFTimeUntilFromDate: JellyVariableReference?
	var interval: Jelly_WFTimeUntilUnit?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetTimeBetweenParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "first" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTimeBetween", name: "first"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "second" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFTimeUntilFromDate = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTimeBetween", name: "second"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "interval" }) {
            parameters.interval = Jelly_WFTimeUntilUnit(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTimeBetween", name: "interval"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"first": "CurrentDate",
			"second": "AdjustedDate",
			"interval": "Minutes",

        ]
    }
}