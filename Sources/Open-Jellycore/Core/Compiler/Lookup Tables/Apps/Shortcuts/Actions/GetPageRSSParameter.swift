//
//  GetPageRSSParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetPageRSSParameter: ParameterProtocol, Codable {
	var WFURLs: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetPageRSSParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFURLs = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getPageRSS", name: "url"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://www.macstories.net/",

        ]
    }
}