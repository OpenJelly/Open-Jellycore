//
//  BookmarkFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct BookmarkFileParameter: ParameterProtocol, Codable {
	var mode: Jelly_BookmarkMode?
	var file: JellyVariableReference?
	var setName: JellyString?
	var getName: JellyArray<JellyVariableReference>?
	var deleteName: JellyArray<JellyVariableReference>?
	var overwriteDupes: JellyBoolean?
	var bookmarkName: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = BookmarkFileParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_BookmarkMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "mode"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setName" }) {
            parameters.setName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "setName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getName" }) {
            parameters.getName = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "getName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deleteName" }) {
            parameters.deleteName = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "deleteName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overwriteDupes" }) {
            parameters.overwriteDupes = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "overwriteDupes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bookmarkName" }) {
            parameters.bookmarkName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bookmarkFile", name: "bookmarkName"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "Get",
			"file": "",
			"setName": "",
			"getName": "User File",
			"deleteName": "",
			"overwriteDupes": "",
			"bookmarkName": "",

        ]
    }
}