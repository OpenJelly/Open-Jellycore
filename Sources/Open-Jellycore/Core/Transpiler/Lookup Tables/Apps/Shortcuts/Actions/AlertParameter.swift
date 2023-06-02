//
//  AlertParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AlertParameter: ParameterProtocol, Codable {
	var WFAlertActionMessage: JellyString?
	var WFAlertActionTitle: JellyString?
	var WFAlertActionCancelButtonShown: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AlertParameter()

        if let value = call.first(where: { node in return node.slotName == "alert" }) {
            parameters.WFAlertActionMessage = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "alert", name: "alert"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.WFAlertActionTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "alert", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "cancel" }) {
            parameters.WFAlertActionCancelButtonShown = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "alert", name: "cancel"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"alert": "Hello World!",
			"title": "My First Jellycut",
			"cancel": "false",

        ]
    }
}