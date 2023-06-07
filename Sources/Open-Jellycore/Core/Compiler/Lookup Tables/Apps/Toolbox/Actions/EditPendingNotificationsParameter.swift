//
//  EditPendingNotificationsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditPendingNotificationsParameter: ParameterProtocol, Codable {
	var mode: Jelly_PendingNotificationMode?
	var notificationID: JellyString?
	var deliveredID: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditPendingNotificationsParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_PendingNotificationMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editPendingNotifications", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "notificationID" }) {
            parameters.notificationID = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editPendingNotifications", name: "notificationID"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deliveredID" }) {
            parameters.deliveredID = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editPendingNotifications", name: "deliveredID"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "ViewPending",
			"notificationID": "AwesomeNotification",
			"deliveredID": "AwesomeDelivery",

        ]
    }
}