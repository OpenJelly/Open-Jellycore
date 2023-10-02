//
//  MakeArchiveParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MakeArchiveParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var type: Jelly_WFArchiveFormat?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MakeArchiveParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "makeArchive", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFArchiveFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "makeArchive", name: "type"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"type": ".zip",

        ]
    }
}
