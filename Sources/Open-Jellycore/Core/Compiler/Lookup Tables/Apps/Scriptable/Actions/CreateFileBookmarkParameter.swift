//
//  CreateFileBookmarkParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateFileBookmarkParameter: ParameterProtocol, Codable {
	var name: JellyString?
	var location: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateFileBookmarkParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createFileBookmark", name: "name"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "location" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.location = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createFileBookmark", name: "location"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "Awesome File",
			"location": "Clipboard",

        ]
    }
}