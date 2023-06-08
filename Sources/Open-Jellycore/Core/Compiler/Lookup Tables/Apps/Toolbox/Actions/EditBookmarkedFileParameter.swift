//
//  EditBookmarkedFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EditBookmarkedFileParameter: ParameterProtocol, Codable {
	var bookmarkedFile: JellyString?
	var bookmarkedFolder: JellyString?
	var mode: Jelly_EditTextMode?
	var replacing: JellyString?
	var texts: JellyArray<JellyVariableReference>?
	var line: JellyInteger?
	var separator: Jelly_CombineText?
	var custom: JellyString?
	var source: Jelly_EditTextSource?
	var path: JellyString?
	var postURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EditBookmarkedFileParameter()

        if let value = call.first(where: { node in return node.slotName == "bookmarkedFile" }) {
            parameters.bookmarkedFile = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "bookmarkedFile"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bookmarkedFolder" }) {
            parameters.bookmarkedFolder = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "bookmarkedFolder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_EditTextMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "replacing" }) {
            parameters.replacing = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "replacing"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "texts" }) {
            parameters.texts = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "texts"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "line" }) {
            parameters.line = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "line"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "separator" }) {
            parameters.separator = Jelly_CombineText(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "separator"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "custom" }) {
            parameters.custom = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "custom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "source" }) {
            parameters.source = Jelly_EditTextSource(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "source"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.path = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "editBookmarkedFile", name: "postURL"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"bookmarkedFile": "\"UserFile\"",
			"bookmarkedFolder": "",
			"mode": "overwriting",
			"replacing": "",
			"texts": "\"${ShortcutInput}\"",
			"line": "",
			"separator": "",
			"custom": "",
			"source": "",
			"path": "",
			"postURL": "",

        ]
    }
}