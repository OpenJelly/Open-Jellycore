//
//  AddPhotoAlbumParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddPhotoAlbumParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var allowDuplicates: JellyBoolean?
	var type: Jelly_PhotoAlbumType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddPhotoAlbumParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addPhotoAlbum", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "allowDuplicates" }) {
            parameters.allowDuplicates = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addPhotoAlbum", name: "allowDuplicates"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_PhotoAlbumType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addPhotoAlbum", name: "type"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "Screenshots",
			"allowDuplicates": "false",
			"type": "Album",

        ]
    }
}
