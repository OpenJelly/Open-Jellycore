//
//  RemoveEventsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveEventsParameter: ParameterProtocol, Codable {
	var WFInputEvents: JellyVariableReference?
	var WFCalendarIncludeFutureEvents: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveEventsParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "events" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInputEvents = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeEvents", name: "events"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeFuture" }) {
            parameters.WFCalendarIncludeFutureEvents = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeEvents", name: "includeFuture"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"events": "myEvents",
			"includeFuture": "true",

        ]
    }
}