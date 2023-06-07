//
//  FindBooksParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindBooksParameter: ParameterProtocol, Codable {
	var query: JellyString?
	var onlyDownloadable: JellyBoolean?
	var availability: Jelly_BookAvailability?
	var type: Jelly_BookType?
	var includePreorders: JellyBoolean?
	var orderBy: Jelly_OrderBooksBy?
	var languageCode: JellyString?
	var resultCount: JellyInteger?
	var renderThumbnails: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FindBooksParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "onlyDownloadable" }) {
            parameters.onlyDownloadable = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "onlyDownloadable"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "availability" }) {
            parameters.availability = Jelly_BookAvailability(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "availability"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_BookType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includePreorders" }) {
            parameters.includePreorders = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "includePreorders"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "orderBy" }) {
            parameters.orderBy = Jelly_OrderBooksBy(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "orderBy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "languageCode" }) {
            parameters.languageCode = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "languageCode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultCount" }) {
            parameters.resultCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "resultCount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "renderThumbnails" }) {
            parameters.renderThumbnails = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findBooks", name: "renderThumbnails"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "\"Harry Potter\"",
			"onlyDownloadable": "true",
			"availability": "all",
			"type": "all",
			"includePreorders": "true",
			"orderBy": "newest",
			"languageCode": "en_us",
			"resultCount": "5",
			"renderThumbnails": "true",

        ]
    }
}