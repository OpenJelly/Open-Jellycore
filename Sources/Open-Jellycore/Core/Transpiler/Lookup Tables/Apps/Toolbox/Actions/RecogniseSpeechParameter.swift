//
//  RecogniseSpeechParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RecogniseSpeechParameter: ParameterProtocol, Codable {
	var audio: JellyVariableReference?
	var openURL: JellyBoolean?
	var postURL: JellyString?
	var additionalPhrases: JellyArray<JellyVariableReference>?
	var language: JellyString?
	var performOffline: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RecogniseSpeechParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "audio" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.audio = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recogniseSpeech", name: "audio"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "openURL" }) {
            parameters.openURL = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recogniseSpeech", name: "openURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recogniseSpeech", name: "postURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "additionalPhrases" }) {
            parameters.additionalPhrases = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recogniseSpeech", name: "additionalPhrases"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "language" }) {
            parameters.language = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recogniseSpeech", name: "language"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "performOffline" }) {
            parameters.performOffline = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recogniseSpeech", name: "performOffline"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"audio": "ShortcutInput",
			"openURL": "true",
			"postURL": "shortcuts://",
			"additionalPhrases": "[\"Jellycuts!\"]",
			"language": "en_us",
			"performOffline": "false",

        ]
    }
}