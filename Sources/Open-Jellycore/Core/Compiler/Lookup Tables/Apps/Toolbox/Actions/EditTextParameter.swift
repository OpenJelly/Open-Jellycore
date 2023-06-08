//
//  EditTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditTextParameter: ParameterProtocol, Codable {
	var textType: Jelly_TextType?
	var text: JellyArray<JellyVariableReference>?
	var openURL: JellyBoolean?
	var postURL: JellyString?
	var title: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditTextParameter()

        if let value = call.first(where: { node in return node.slotName == "textType" }) {
            parameters.textType = Jelly_TextType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editText", name: "textType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "openURL" }) {
            parameters.openURL = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editText", name: "openURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editText", name: "postURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editText", name: "title"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"textType": "newText",
			"text": "[\"Cool Text\"]",
			"openURL": "true",
			"postURL": "\"shortcuts://\"",
			"title": "\"Editing Text\"",

        ]
    }
}