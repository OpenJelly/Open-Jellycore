//
//  FindVideosParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindVideosParameter: ParameterProtocol, Codable {
	var query: JellyString?
	var orientation: Jelly_VideoOrientation?
	var minimumSize: Jelly_MinVidSize?
	var resultsPerPage: JellyInteger?
	var pageNumber: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FindVideosParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findVideos", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "orientation" }) {
            parameters.orientation = Jelly_VideoOrientation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findVideos", name: "orientation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "minimumSize" }) {
            parameters.minimumSize = Jelly_MinVidSize(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findVideos", name: "minimumSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultsPerPage" }) {
            parameters.resultsPerPage = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findVideos", name: "resultsPerPage"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pageNumber" }) {
            parameters.pageNumber = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "findVideos", name: "pageNumber"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "Celebrating",
			"orientation": "portrait",
			"minimumSize": "all",
			"resultsPerPage": "25",
			"pageNumber": "1",

        ]
    }
}
