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
            parameters.behavior = Jelly_WFPlayPauseBehavior(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "play", name: "behavior"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "source" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "play", name: "source"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"behavior": "Play",
			"source": "iPhone",

        ]
    }
}