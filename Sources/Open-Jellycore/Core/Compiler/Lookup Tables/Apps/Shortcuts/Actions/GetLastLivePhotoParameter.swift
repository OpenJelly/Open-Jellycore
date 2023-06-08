//
//  GetLastLivePhotoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLastLivePhotoParameter: ParameterProtocol, Codable {
	var WFGetLatestPhotoCount: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLastLivePhotoParameter()

        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFGetLatestPhotoCount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getLastLivePhoto", name: "count"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"count": "1",

        ]
    }
}