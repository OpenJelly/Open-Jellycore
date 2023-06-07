//
//  CreateRemindersListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateRemindersListParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var useHex: JellyBoolean?
	var colours: Jelly_DefaultColours?
	var hexCode: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateRemindersListParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createRemindersList", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useHex" }) {
            parameters.useHex = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createRemindersList", name: "useHex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "colours" }) {
            parameters.colours = Jelly_DefaultColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createRemindersList", name: "colours"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hexCode" }) {
            parameters.hexCode = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createRemindersList", name: "hexCode"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "\"My new list\"",
			"useHex": "false",
			"colours": "Indigo",
			"hexCode": "\"\"",

        ]
    }
}