//
//  PlayParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PlayParameter: ParameterProtocol, Codable {
	var behavior: Jelly_WFPlayPauseBehavior?
	var WFMediaRoute: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PlayParameter()

        if let value = call.first(where: { node in return node.slotName == "behavior" }) {
            parameters.behavior = Jelly_WFPlayPauseBehavior(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "play", name: "behavior"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "source" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "play", name: "source"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"behavior": "Play",
			"source": "iPhone",

        ]
    }
}
