//
//  GetUpcomingRemindersParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetUpcomingRemindersParameter: ParameterProtocol, Codable {
	var WFGetUpcomingItemCount: JellyDouble?
	var WFGetUpcomingItemCalendar: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetUpcomingRemindersParameter()

        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFGetUpcomingItemCount = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getUpcomingReminders", name: "count"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.WFGetUpcomingItemCalendar = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getUpcomingReminders", name: "list"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"count": "5",
			"list": "Reminders",

        ]
    }
}