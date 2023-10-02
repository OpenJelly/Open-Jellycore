//
//  CreateCalendarParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateCalendarParameter: ParameterProtocol, Codable {
	var title: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateCalendarParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createCalendar", name: "title"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "\"Events\"",

        ]
    }
}
