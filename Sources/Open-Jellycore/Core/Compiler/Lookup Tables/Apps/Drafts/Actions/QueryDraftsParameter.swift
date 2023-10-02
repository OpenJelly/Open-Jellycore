//
//  QueryDraftsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QueryDraftsParameter: ParameterProtocol, Codable {
	var queryString: JellyString?
	var folder: Jelly_DraftResponseFolder?
	var tagFilter: JellyString?
	var flaggedStatus: Jelly_DraftQueryFlaggedStatus?
	var sortOrder: Jelly_DraftQuerySort?
	var sortDescending: JellyBoolean?
	var sortFlaggedToTop: JellyBoolean?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QueryDraftsParameter()

        if let value = call.first(where: { node in return node.slotName == "queryString" }) {
            parameters.queryString = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "queryString"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "folder" }) {
            parameters.folder = Jelly_DraftResponseFolder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "folder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tagFilter" }) {
            parameters.tagFilter = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "tagFilter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "flaggedStatus" }) {
            parameters.flaggedStatus = Jelly_DraftQueryFlaggedStatus(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "flaggedStatus"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortOrder" }) {
            parameters.sortOrder = Jelly_DraftQuerySort(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "sortOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortDescending" }) {
            parameters.sortDescending = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "sortDescending"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortFlaggedToTop" }) {
            parameters.sortFlaggedToTop = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "sortFlaggedToTop"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "queryDrafts", name: "limit"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"queryString": "\"Awesome Drafts\"",
			"folder": "inbox",
			"tagFilter": "\"Jellycuts\"",
			"flaggedStatus": "flagged",
			"sortOrder": "created",
			"sortDescending": "false",
			"sortFlaggedToTop": "true",
			"limit": "100",

        ]
    }
}
