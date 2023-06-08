//
//  FindPexelPhotosParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FindPexelPhotosParameter: ParameterProtocol, Codable {
	var query: JellyString?
	var orientation: Jelly_VideoOrientation?
	var minimumSize: Jelly_MinPhotoSize?
	var colour: Jelly_PexelPhotoColours?
	var hexCode: JellyString?
	var resultsPerPage: JellyInteger?
	var pageNumber: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FindPexelPhotosParameter()

        if let value = call.first(where: { node in return node.slotName == "query" }) {
            parameters.query = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "query"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "orientation" }) {
            parameters.orientation = Jelly_VideoOrientation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "orientation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "minimumSize" }) {
            parameters.minimumSize = Jelly_MinPhotoSize(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "minimumSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "colour" }) {
            parameters.colour = Jelly_PexelPhotoColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "colour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hexCode" }) {
            parameters.hexCode = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "hexCode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultsPerPage" }) {
            parameters.resultsPerPage = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "resultsPerPage"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pageNumber" }) {
            parameters.pageNumber = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "findPexelPhotos", name: "pageNumber"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"query": "Celebrating",
			"orientation": "portrait",
			"minimumSize": "small",
			"colour": "all",
			"hexCode": "",
			"resultsPerPage": "10",
			"pageNumber": "1",

        ]
    }
}