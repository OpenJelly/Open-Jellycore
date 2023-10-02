//
//  ExtractArchiveParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ExtractArchiveParameter: ParameterProtocol, Codable {
	var WFArchive: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ExtractArchiveParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFArchive = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "extractArchive", name: "input"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",

        ]
    }
}
