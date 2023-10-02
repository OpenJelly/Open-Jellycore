//
//  GetLastVideoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLastVideoParameter: ParameterProtocol, Codable {
	var WFGetLatestPhotoCount: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLastVideoParameter()

        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFGetLatestPhotoCount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getLastVideo", name: "count"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"count": "1",

        ]
    }
}
