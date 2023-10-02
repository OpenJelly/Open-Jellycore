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
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFSourceMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "handoffPlayback", name: "source"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "route" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFDestinationMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "handoffPlayback", name: "route"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"source": "ShortcutInput",
			"route": "iPhone",

        ]
    }
}
