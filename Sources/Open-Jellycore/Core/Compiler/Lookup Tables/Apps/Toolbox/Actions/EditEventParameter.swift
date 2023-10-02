//
//  EditEventParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditEventParameter: ParameterProtocol, Codable {
	var eventID: JellyString?
	var editType: Jelly_EditEventType?
	var title: JellyString?
	var startDate: JellyDate?
	var endDate: JellyDate?
	var notes: JellyString?
	var location: ShortcutsPlacemark?
	var url: JellyString?
	var availability: Jelly_EventAvailability?
	var calendar: JellyString?
	var editRecurring: Jelly_EditRecurringEvent?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditEventParameter()

        if let value = call.first(where: { node in return node.slotName == "eventID" }) {
            parameters.eventID = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "eventID"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "editType" }) {
            parameters.editType = Jelly_EditEventType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "editType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDate" }) {
            parameters.startDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "startDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "endDate" }) {
            parameters.endDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "endDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "notes" }) {
            parameters.notes = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "notes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "availability" }) {
            parameters.availability = Jelly_EventAvailability(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "availability"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "calendar" }) {
            parameters.calendar = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "calendar"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "editRecurring" }) {
            parameters.editRecurring = Jelly_EditRecurringEvent(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editEvent", name: "editRecurring"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"eventID": "\"3147adf\"",
			"editType": "Title",
			"title": "\"New title\"",
			"startDate": "",
			"endDate": "",
			"notes": "",
			"location": "",
			"url": "",
			"availability": "",
			"calendar": "",
			"editRecurring": "",

        ]
    }
}
