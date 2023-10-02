//
//  ParseWebsiteSourceParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ParseWebsiteSourceParameter: ParameterProtocol, Codable {
	var url: JellyString?
	var contents: Jelly_HTMLSource?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ParseWebsiteSourceParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "parseWebsiteSource", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "contents" }) {
            parameters.contents = Jelly_HTMLSource(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "parseWebsiteSource", name: "contents"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycuts.com",
			"contents": "rawHTML",

        ]
    }
}
