//
//  GetLastPhotoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLastPhotoParameter: ParameterProtocol, Codable {
	var WFGetLatestPhotoCount: JellyDouble?
	var WFGetLatestPhotosActionIncludeScreenshots: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLastPhotoParameter()

        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFGetLatestPhotoCount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getLastPhoto", name: "count"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "screenshots" }) {
            parameters.WFGetLatestPhotosActionIncludeScreenshots = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getLastPhoto", name: "screenshots"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"count": "10",
			"screenshots": "false",

        ]
    }
}