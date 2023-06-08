//
//  GetTextFromImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetTextFromImageParameter: ParameterProtocol, Codable {
	var image: JellyVariableReference?
	var languageCorrection: JellyBoolean?
	var language: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetTextFromImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImage", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "languageCorrection" }) {
            parameters.languageCorrection = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImage", name: "languageCorrection"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "language" }) {
            parameters.language = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImage", name: "language"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",
			"languageCorrection": "false",
			"language": "English",

        ]
    }
}