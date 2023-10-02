//
//  OpenSubredditParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenSubredditParameter: ParameterProtocol, Codable {
	var subreddit: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenSubredditParameter()

        if let value = call.first(where: { node in return node.slotName == "subreddit" }) {
            parameters.subreddit = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "openSubreddit", name: "subreddit"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"subreddit": "ApolloApp",

        ]
    }
}
