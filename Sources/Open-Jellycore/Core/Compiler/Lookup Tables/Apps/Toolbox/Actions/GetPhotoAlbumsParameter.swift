//
//  GetPhotoAlbumsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetPhotoAlbumsParameter: ParameterProtocol, Codable {
	var type: Jelly_AlbumType?
	var subType: Jelly_AlbumSubType?
	var sortBy: Jelly_SortAlbums?
	var sortOrder: Jelly_AlbumSortOrder?
	var limit: JellyBoolean?
	var limitCount: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetPhotoAlbumsParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_AlbumType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPhotoAlbums", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "subType" }) {
            parameters.subType = Jelly_AlbumSubType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPhotoAlbums", name: "subType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortBy" }) {
            parameters.sortBy = Jelly_SortAlbums(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPhotoAlbums", name: "sortBy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortOrder" }) {
            parameters.sortOrder = Jelly_AlbumSortOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPhotoAlbums", name: "sortOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPhotoAlbums", name: "limit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitCount" }) {
            parameters.limitCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getPhotoAlbums", name: "limitCount"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "User",
			"subType": "All",
			"sortBy": "Title",
			"sortOrder": "Ascending",
			"limit": "true",
			"limitCount": "10",

        ]
    }
}
