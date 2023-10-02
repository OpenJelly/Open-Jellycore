//
//  RemoveFromAlbumParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveFromAlbumParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFRemoveAlbumSelectedGroup: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveFromAlbumParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeFromAlbum", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "album" }) {
            parameters.WFRemoveAlbumSelectedGroup = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeFromAlbum", name: "album"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "avatar",
			"album": "a-Profiles",

        ]
    }
}
