//
//  EditURLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditURLParameter: ParameterProtocol, Codable {
	var action: Jelly_EditURLAction?
	var queryItemName: JellyString?
	var queryItemValue: JellyString?
	var addPathComponentValue: JellyString?
	var appendToQueryValue: JellyString?
	var appendToFragmentValue: JellyString?
	var removeQueryItemsNamedValue: JellyString?
	var username: JellyString?
	var password: JellyString?
	var setQueryValue: JellyString?
	var setFragmentValue: JellyString?
	var setPathValue: JellyString?
	var setSchemeValue: JellyString?
	var setHostValue: JellyString?
	var url: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditURLParameter()

        if let value = call.first(where: { node in return node.slotName == "action" }) {
            parameters.action = Jelly_EditURLAction(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "action"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryItemName" }) {
            parameters.queryItemName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "queryItemName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryItemValue" }) {
            parameters.queryItemValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "queryItemValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addPathComponentValue" }) {
            parameters.addPathComponentValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "addPathComponentValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "appendToQueryValue" }) {
            parameters.appendToQueryValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "appendToQueryValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "appendToFragmentValue" }) {
            parameters.appendToFragmentValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "appendToFragmentValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeQueryItemsNamedValue" }) {
            parameters.removeQueryItemsNamedValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "removeQueryItemsNamedValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "username" }) {
            parameters.username = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "username"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "password" }) {
            parameters.password = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "password"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setQueryValue" }) {
            parameters.setQueryValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "setQueryValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setFragmentValue" }) {
            parameters.setFragmentValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "setFragmentValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setPathValue" }) {
            parameters.setPathValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "setPathValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setSchemeValue" }) {
            parameters.setSchemeValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "setSchemeValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setHostValue" }) {
            parameters.setHostValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "setHostValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "editURL", name: "url"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"action": "addPathComponent",
			"queryItemName": "\"\"",
			"queryItemValue": "\"\"",
			"addPathComponentValue": "\"\"",
			"appendToQueryValue": "\"\"",
			"appendToFragmentValue": "\"\"",
			"removeQueryItemsNamedValue": "\"\"",
			"username": "\"\"",
			"password": "\"\"",
			"setQueryValue": "\"\"",
			"setFragmentValue": "\"\"",
			"setPathValue": "\"\"",
			"setSchemeValue": "\"\"",
			"setHostValue": "\"\"",
			"url": "\"https://jellycuts.com\"",

        ]
    }
}
