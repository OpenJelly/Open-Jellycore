//
//  SubscribeToPodcastParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SubscribeToPodcastParameter: ParameterProtocol, Codable {
	var WFInput: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SubscribeToPodcastParameter()

        if let value = call.first(where: { node in return node.slotName == "feedURL" }) {
            parameters.WFInput = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "subscribeToPodcast", name: "feedURL"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"feedURL": "https://atp.fm/rss",

        ]
    }
}
