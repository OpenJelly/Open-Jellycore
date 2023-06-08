//
//  DownloadUnsplashPhotosParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DownloadUnsplashPhotosParameter: ParameterProtocol, Codable {
	var ids: JellyArray<JellyVariableReference>?
	var photoSize: Jelly_PhotoSize?
	var width: JellyInteger?
	var height: JellyInteger?
	var scale: Jelly_PhotoScaleType?
	var format: Jelly_PhotoFormats?
	var quality: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DownloadUnsplashPhotosParameter()

        if let value = call.first(where: { node in return node.slotName == "ids" }) {
            parameters.ids = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "ids"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "photoSize" }) {
            parameters.photoSize = Jelly_PhotoSize(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "photoSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.width = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.height = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "height"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scale" }) {
            parameters.scale = Jelly_PhotoScaleType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "scale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.format = Jelly_PhotoFormats(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "format"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "quality" }) {
            parameters.quality = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadUnsplashPhotos", name: "quality"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"ids": "[\"ezEn4jYrVYQ\"]",
			"photoSize": "custom",
			"width": "1024",
			"height": "1024",
			"scale": "fit",
			"format": "jpeg",
			"quality": "1",

        ]
    }
}