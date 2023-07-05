//
//  GetFileLinkParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFileLinkParameter: ParameterProtocol, Codable {
	var WFFile: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFileLinkParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFFile = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFileLink", name: "file"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",

        ]
    }
}