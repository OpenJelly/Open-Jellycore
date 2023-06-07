//
//  SpeakTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SpeakTextParameter: ParameterProtocol, Codable {
	var WFText: JellyString?
	var WFSpeakTextWait: JellyBoolean?
	var WFSpeakTextRate: JellyDouble?
	var WFSpeakTextPitch: JellyDouble?
	var language: Jelly_WFSpeakTextLanguage?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SpeakTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "speakText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "wait" }) {
            parameters.WFSpeakTextWait = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "speakText", name: "wait"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rate" }) {
            parameters.WFSpeakTextRate = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "speakText", name: "rate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pitch" }) {
            parameters.WFSpeakTextPitch = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "speakText", name: "pitch"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "language" }) {
            parameters.language = Jelly_WFSpeakTextLanguage(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "speakText", name: "language"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello World!",
			"wait": "false",
			"rate": "1",
			"pitch": "1",
			"language": "en-US",

        ]
    }
}