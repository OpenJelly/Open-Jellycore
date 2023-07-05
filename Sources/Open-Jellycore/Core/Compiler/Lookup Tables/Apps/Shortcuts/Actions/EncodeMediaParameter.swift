//
//  EncodeMediaParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct EncodeMediaParameter: ParameterProtocol, Codable {
	var WFMedia: JellyVariableReference?
	var size: Jelly_WFMediaSize?
	var speed: Jelly_WFMediaSpeed?
	var WFMediaCustomSpeed: JellyString?
	var WFMetadataTitle: JellyString?
	var WFMetadataArtist: JellyString?
	var WFMetadataAlbum: JellyString?
	var WFMetadataGenre: JellyString?
	var WFMetadataYear: JellyDouble?
	var WFMetadataArtwork: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = EncodeMediaParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "media" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFMedia = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "media"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "size" }) {
            parameters.size = Jelly_WFMediaSize(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "size"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "speed" }) {
            parameters.speed = Jelly_WFMediaSpeed(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "speed"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customSpeed" }) {
            parameters.WFMediaCustomSpeed = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "customSpeed"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.WFMetadataTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "artist" }) {
            parameters.WFMetadataArtist = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "artist"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "album" }) {
            parameters.WFMetadataAlbum = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "album"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "genre" }) {
            parameters.WFMetadataGenre = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "genre"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "year" }) {
            parameters.WFMetadataYear = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "year"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "artwork" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFMetadataArtwork = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "encodeMedia", name: "artwork"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"media": "ShortcutInput",
			"size": "1920x1080",
			"speed": "Normal",
			"customSpeed": "0",
			"title": "Awesome Video",
			"artist": "Zachary",
			"album": "Videos",
			"genre": "Indie",
			"year": "2021",
			"artwork": "Image",

        ]
    }
}