//
//  GetTextFromImagesIAIHParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetTextFromImagesIAIHParameter: ParameterProtocol, Codable {
	var images: JellyVariableReference?
	var languageCorrection: JellyBoolean?
	var language: JellyString?
	var joinText: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetTextFromImagesIAIHParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "images" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.images = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImagesIAIH", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "languageCorrection" }) {
            parameters.languageCorrection = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImagesIAIH", name: "languageCorrection"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "language" }) {
            parameters.language = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImagesIAIH", name: "language"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "joinText" }) {
            parameters.joinText = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromImagesIAIH", name: "joinText"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"images": "ShortcutInput",
			"languageCorrection": "true",
			"language": "en_us",
			"joinText": "true",

        ]
    }
}