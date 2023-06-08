//
//  EditReminderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditReminderParameter: ParameterProtocol, Codable {
	var editType: Jelly_EditReminderType?
	var title: JellyString?
	var note: JellyString?
	var dueDate: JellyDate?
	var priority: Jelly_ReminderPriority?
	var list: JellyString?
	var location: ShortcutsPlacemark?
	var repeatType: Jelly_RepeatType?
	var locationType: Jelly_LocationAlertType?
	var alertDate: JellyDate?
	var id: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditReminderParameter()

        if let value = call.first(where: { node in return node.slotName == "editType" }) {
            parameters.editType = Jelly_EditReminderType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "editType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "note" }) {
            parameters.note = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "note"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dueDate" }) {
            parameters.dueDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "dueDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "priority" }) {
            parameters.priority = Jelly_ReminderPriority(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "priority"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "repeatType" }) {
            parameters.repeatType = Jelly_RepeatType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "repeatType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "locationType" }) {
            parameters.locationType = Jelly_LocationAlertType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "locationType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "alertDate" }) {
            parameters.alertDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "alertDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "id" }) {
            parameters.id = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editReminder", name: "id"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"editType": "ChangeTitle",
			"title": "CodeMoreJellycuts!",
			"note": "",
			"dueDate": "",
			"priority": "",
			"list": "",
			"location": "",
			"repeatType": "",
			"locationType": "",
			"alertDate": "",
			"id": "${ShortcutInput}",

        ]
    }
}
