//
//  FileInfoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FileInfoParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FileInfoParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "fileInfo", name: "file"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",

        ]
    }
}
