//
//  CreateEventParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateEventParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var calendar: JellyString?
	var isAllDay: JellyBoolean?
	var startTime: JellyDate?
	var endTime: JellyDate?
	var startDate: JellyDate?
	var endDate: JellyDate?
	var alertTime: Jelly_EventAlert?
	var alertDate: JellyDate?
	var recur: Jelly_RepeatType?
	var availability: Jelly_EventAvailability?
	var notes: JellyString?
	var addLocation: JellyBoolean?
	var location: ShortcutsPlacemark?
	var addURL: JellyBoolean?
	var url: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateEventParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "calendar" }) {
            parameters.calendar = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "calendar"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isAllDay" }) {
            parameters.isAllDay = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "isAllDay"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startTime" }) {
            parameters.startTime = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "startTime"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "endTime" }) {
            parameters.endTime = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "endTime"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDate" }) {
            parameters.startDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "startDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "endDate" }) {
            parameters.endDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "endDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "alertTime" }) {
            parameters.alertTime = Jelly_EventAlert(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "alertTime"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "alertDate" }) {
            parameters.alertDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "alertDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "recur" }) {
            parameters.recur = Jelly_RepeatType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "recur"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "availability" }) {
            parameters.availability = Jelly_EventAvailability(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "availability"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "notes" }) {
            parameters.notes = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "notes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addLocation" }) {
            parameters.addLocation = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "addLocation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addURL" }) {
            parameters.addURL = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "addURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createEvent", name: "url"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "\"Awesome Event\"",
			"calendar": "-cContacts",
			"isAllDay": "true",
			"startTime": "",
			"endTime": "",
			"startDate": "",
			"endDate": "",
			"alertTime": "",
			"alertDate": "",
			"recur": "",
			"availability": "",
			"notes": "",
			"addLocation": "",
			"location": "",
			"addURL": "",
			"url": "",

        ]
    }
}
