//
//  ShortcutMetadataParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShortcutMetadataParameter: ParameterProtocol, Codable {
	var shortcut: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShortcutMetadataParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "shortcut" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.shortcut = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shortcutMetadata", name: "shortcut"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"shortcut": "ShortcutInput",

        ]
    }
}