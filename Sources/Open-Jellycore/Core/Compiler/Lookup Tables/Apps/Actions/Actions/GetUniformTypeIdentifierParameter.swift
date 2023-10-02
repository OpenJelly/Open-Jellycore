//
//  GetUniformTypeIdentifierParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetUniformTypeIdentifierParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetUniformTypeIdentifierParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getUniformTypeIdentifier", name: "file"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",

        ]
    }
}
