//
//  HandoffPlaybackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct HandoffPlaybackParameter: ParameterProtocol, Codable {
	var WFSourceMediaRoute: JellyVariableReference?
	var WFDestinationMediaRoute: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = HandoffPlaybackParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "source" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFSourceMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "handoffPlayback", name: "source"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "route" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFDestinationMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "handoffPlayback", name: "route"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"source": "ShortcutInput",
			"route": "iPhone",

        ]
    }
}