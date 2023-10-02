//
//  GetArticleParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetArticleParameter: ParameterProtocol, Codable {
	var WFWebPage: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetArticleParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFWebPage = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getArticle", name: "url"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycuts.com",

        ]
    }
}
