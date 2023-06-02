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

        if let variableCall = call.first(where: { node in return node.slotName == "first" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTimeBetween", name: "first"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "second" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFTimeUntilFromDate = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTimeBetween", name: "second"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "interval" }) {
            parameters.interval = Jelly_WFTimeUntilUnit(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTimeBetween", name: "interval"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"first": "CurrentDate",
			"second": "AdjustedDate",
			"interval": "Minutes",

        ]
    }
}