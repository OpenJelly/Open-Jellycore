//
//  CreateReminderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateReminderParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var priority: Jelly_ReminderPriority?
	var list: JellyString?
	var startDateType: Jelly_ReminderStartType?
	var startDateTime: JellyDate?
	var startDate: JellyDate?
	var dueDateType: Jelly_ReminderDueType?
	var dueDateTime: JellyDate?
	var dueDate: JellyDate?
	var notes: JellyString?
	var addAlert: JellyBoolean?
	var date: JellyDate?
	var repeatType: Jelly_RepeatType?
	var addLocation: JellyBoolean?
	var location: ShortcutsPlacemark?
	var locationAlertType: Jelly_LocationAlertType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateReminderParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "priority" }) {
            parameters.priority = Jelly_ReminderPriority(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "priority"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDateType" }) {
            parameters.startDateType = Jelly_ReminderStartType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "startDateType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDateTime" }) {
            parameters.startDateTime = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "startDateTime"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDate" }) {
            parameters.startDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "startDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dueDateType" }) {
            parameters.dueDateType = Jelly_ReminderDueType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "dueDateType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dueDateTime" }) {
            parameters.dueDateTime = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "dueDateTime"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dueDate" }) {
            parameters.dueDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "dueDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "notes" }) {
            parameters.notes = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "notes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addAlert" }) {
            parameters.addAlert = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "addAlert"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "repeatType" }) {
            parameters.repeatType = Jelly_RepeatType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "repeatType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addLocation" }) {
            parameters.addLocation = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "addLocation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "locationAlertType" }) {
            parameters.locationAlertType = Jelly_LocationAlertType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createReminder", name: "locationAlertType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "Code some Jellycuts!",
			"priority": "High",
			"list": "Reminders",
			"startDateType": "DateAndTime",
			"startDateTime": "3:00 PM",
			"startDate": "CurrentDate",
			"dueDateType": "DateAndTime",
			"dueDateTime": "3:00 PM",
			"dueDate": "CurrentDate",
			"notes": "Code some cool shortcuts using Jellycuts",
			"addAlert": "false",
			"date": "",
			"repeatType": "Daily",
			"addLocation": "true",
			"location": "Placemark(addressDictionary: AddressDictionary(City: \"\", Country: \"\", CountryCode: \"\", FormattedAddressLines: [\"\", \"\"], Name: \"\", State: \"\", Street: \"\"), SubAdministrativeArea: \"\", SubThoroughfare: \"\", Thoroughfare: \"\", ZIP: \"\"), location: Location(altitude: 0, course: 1, horizontalAccuracy: 0.0, latitude: 0, longitude: 0, speed: 1, timestamp: 2022-02-22t22:22:22Z, verticalAccuracy: 1), region: Region(center: Center(latitude: 0.0, longitude: 0.0), identifier: \"\", radius: 100.0))",
			"locationAlertType": "Arriving",

        ]
    }
}
