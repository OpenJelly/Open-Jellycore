//
//  GetEventIDParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetEventIDParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var startDate: JellyDate?
	var calendar: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetEventIDParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getEventID", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDate" }) {
            parameters.startDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getEventID", name: "startDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "calendar" }) {
            parameters.calendar = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getEventID", name: "calendar"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "\"1.0 Release Date\"",
			"startDate": "${Release Date}",
			"calendar": "c-Events",

        ]
    }
}