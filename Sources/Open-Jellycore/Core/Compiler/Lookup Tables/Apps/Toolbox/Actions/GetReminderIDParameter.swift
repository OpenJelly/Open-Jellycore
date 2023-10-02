//
//  GetReminderIDParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetReminderIDParameter: ParameterProtocol, Codable {
	var reminder: JellyString?
	var list: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetReminderIDParameter()

        if let value = call.first(where: { node in return node.slotName == "reminder" }) {
            parameters.reminder = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getReminderID", name: "reminder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getReminderID", name: "list"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"reminder": "\"Program more!\"",
			"list": "r-Reminders",

        ]
    }
}
