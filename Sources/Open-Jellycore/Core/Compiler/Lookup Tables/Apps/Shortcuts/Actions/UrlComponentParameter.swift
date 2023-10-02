//
//  UrlComponentParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UrlComponentParameter: ParameterProtocol, Codable {
	var WFURL: JellyString?
	var component: Jelly_WFURLComponent?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UrlComponentParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "urlComponent", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "component" }) {
            parameters.component = Jelly_WFURLComponent(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "urlComponent", name: "component"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycuts.com",
			"component": "Scheme",

        ]
    }
}
