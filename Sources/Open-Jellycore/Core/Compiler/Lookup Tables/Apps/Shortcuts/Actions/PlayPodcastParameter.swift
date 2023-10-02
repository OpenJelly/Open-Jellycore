//
//  PlayPodcastParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PlayPodcastParameter: ParameterProtocol, Codable {
	var WFPodcastShow: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PlayPodcastParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "podcast" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFPodcastShow = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "playPodcast", name: "podcast"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"podcast": "Launched #2",

        ]
    }
}
