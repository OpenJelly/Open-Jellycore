//
//  GetPlaylistsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetPlaylistsParameter: ParameterProtocol, Codable {
	var types: Jelly_PlaylistAccessTypes?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetPlaylistsParameter()

        if let value = call.first(where: { node in return node.slotName == "types" }) {
            parameters.types = Jelly_PlaylistAccessTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getPlaylists", name: "types"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"types": "editable",

        ]
    }
}