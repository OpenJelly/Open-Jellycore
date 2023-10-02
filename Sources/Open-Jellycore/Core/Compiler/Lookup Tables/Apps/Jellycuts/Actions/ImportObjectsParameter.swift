//
//  ImportObjectsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ImportObjectsParameter: ParameterProtocol, Codable {
	var shortcut: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ImportObjectsParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.shortcut = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "importObjects", name: "file"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "Selected Shortcut",

        ]
    }
}
