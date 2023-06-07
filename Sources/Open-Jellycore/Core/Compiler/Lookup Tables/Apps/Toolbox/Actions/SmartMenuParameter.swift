//
//  SmartMenuParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SmartMenuParameter: ParameterProtocol, Codable {
	var sourceList: JellyVariableReference?
	var openURL: JellyBoolean?
	var postURL: JellyString?
	var title: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SmartMenuParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "sourceList" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.sourceList = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "smartMenu", name: "sourceList"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "openURL" }) {
            parameters.openURL = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "smartMenu", name: "openURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "smartMenu", name: "postURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "smartMenu", name: "title"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"sourceList": "ShortcutInput",
			"openURL": "true",
			"postURL": "shortcuts://",
			"title": "Edit List",

        ]
    }
}