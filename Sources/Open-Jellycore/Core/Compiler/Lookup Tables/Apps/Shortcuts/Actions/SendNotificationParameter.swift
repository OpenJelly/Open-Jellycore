//
//  SendNotificationParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SendNotificationParameter: ParameterProtocol, Codable {
	var WFNotificationActionBody: JellyString?
	var WFNotificationActionTitle: JellyString?
	var WFNotificationActionSound: JellyBoolean?
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SendNotificationParameter()

        if let value = call.first(where: { node in return node.slotName == "body" }) {
            parameters.WFNotificationActionBody = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sendNotification", name: "body"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.WFNotificationActionTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sendNotification", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sound" }) {
            parameters.WFNotificationActionSound = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sendNotification", name: "sound"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "attachment" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sendNotification", name: "attachment"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"body": "Hello World!",
			"title": "My First Jellycut",
			"sound": "false",
			"attachment": "ShortcutInput",

        ]
    }
}