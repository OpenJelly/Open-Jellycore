//
//  GetLastScreenshotParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLastScreenshotParameter: ParameterProtocol, Codable {
	var WFGetLatestPhotoCount: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLastScreenshotParameter()

        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFGetLatestPhotoCount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getLastScreenshot", name: "count"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"count": "1",

        ]
    }
}