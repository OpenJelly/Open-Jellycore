//
//  AddNewCalendarParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddNewCalendarParameter: ParameterProtocol, Codable {
	var CalendarName: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddNewCalendarParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.CalendarName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addNewCalendar", name: "name"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "My new calendar",

        ]
    }
}