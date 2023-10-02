//
//  ShowInCalendarParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShowInCalendarParameter: ParameterProtocol, Codable {
	var WFEvent: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShowInCalendarParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "event" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFEvent = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "showInCalendar", name: "event"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"event": "ShortcutInput",

        ]
    }
}
