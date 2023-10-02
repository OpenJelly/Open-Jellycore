//
//  ShowWebPageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShowWebPageParameter: ParameterProtocol, Codable {
	var WFURL: JellyString?
	var WFEnterSafariReader: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShowWebPageParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "showWebPage", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "reader" }) {
            parameters.WFEnterSafariReader = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "showWebPage", name: "reader"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycuts.com",
			"reader": "false",

        ]
    }
}
