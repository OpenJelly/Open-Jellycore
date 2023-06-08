//
//  EncodeAudioParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EncodeAudioParameter: ParameterProtocol, Codable {
	var WFMedia: JellyVariableReference?
	var format: Jelly_WFMediaAudioFormat?
	var speed: Jelly_WFMediaSpeed?
	var WFMediaCustomSpeed: JellyString?
	var WFMetadataTitle: JellyString?
	var WFMetadataArtist: JellyString?
	var WFMetadataAlbum: JellyString?
	var WFMetadataGenre: JellyString?
	var WFMetadataYear: JellyDouble?
	var WFMetadataArtwork: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EncodeAudioParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "media" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFMedia = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "media"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.format = Jelly_WFMediaAudioFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "format"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "speed" }) {
            parameters.speed = Jelly_WFMediaSpeed(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "speed"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customSpeed" }) {
            parameters.WFMediaCustomSpeed = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "customSpeed"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.WFMetadataTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "artist" }) {
            parameters.WFMetadataArtist = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "artist"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "album" }) {
            parameters.WFMetadataAlbum = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "album"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "genre" }) {
            parameters.WFMetadataGenre = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "genre"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "year" }) {
            parameters.WFMetadataYear = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "year"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "artwork" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFMetadataArtwork = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeAudio", name: "artwork"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"media": "ShortcutInput",
			"format": "M4A",
			"speed": "Normal",
			"customSpeed": "0",
			"title": "Awesome Audio",
			"artist": "Zachary",
			"album": "Music",
			"genre": "Indie",
			"year": "2021",
			"artwork": "Image",

        ]
    }
}