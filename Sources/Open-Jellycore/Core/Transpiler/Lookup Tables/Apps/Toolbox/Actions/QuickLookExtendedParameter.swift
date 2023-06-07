//
//  QuickLookExtendedParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QuickLookExtendedParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var body: JellyVariableReference?
	var openURL: JellyBoolean?
	var postURL: JellyString?
	var theme: Jelly_PreviewThemes?
	var imageSize: Jelly_PreviewImageSize?
	var imageAlignment: Jelly_PreviewAlignment?
	var imageShadows: JellyBoolean?
	var textAlignment: Jelly_PreviewAlignment?
	var buttonStyle: Jelly_PreviewButtonStyle?
	var buttonRadius: JellyInteger?
	var imageMask: Jelly_PreviewImageMask?
	var imageRadius: JellyInteger?
	var mapPin: JellyBoolean?
	var mapZoom: JellyDouble?
	var mapInteractivity: JellyBoolean?
	var mapSize: Jelly_MapSize?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QuickLookExtendedParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "title"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "body" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.body = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "body"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "openURL" }) {
            parameters.openURL = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "openURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "postURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "theme" }) {
            parameters.theme = Jelly_PreviewThemes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "theme"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "imageSize" }) {
            parameters.imageSize = Jelly_PreviewImageSize(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "imageSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "imageAlignment" }) {
            parameters.imageAlignment = Jelly_PreviewAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "imageAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "imageShadows" }) {
            parameters.imageShadows = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "imageShadows"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "textAlignment" }) {
            parameters.textAlignment = Jelly_PreviewAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "textAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "buttonStyle" }) {
            parameters.buttonStyle = Jelly_PreviewButtonStyle(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "buttonStyle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "buttonRadius" }) {
            parameters.buttonRadius = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "buttonRadius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "imageMask" }) {
            parameters.imageMask = Jelly_PreviewImageMask(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "imageMask"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "imageRadius" }) {
            parameters.imageRadius = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "imageRadius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapPin" }) {
            parameters.mapPin = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "mapPin"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapZoom" }) {
            parameters.mapZoom = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "mapZoom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapInteractivity" }) {
            parameters.mapInteractivity = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "mapInteractivity"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapSize" }) {
            parameters.mapSize = Jelly_MapSize(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quickLookExtended", name: "mapSize"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "\"This shortcut's input\"",
			"body": "ShortcutInput",
			"openURL": "true",
			"postURL": "\"shortcuts://\"",
			"theme": "Midnight",
			"imageSize": "fullWidth",
			"imageAlignment": "Central",
			"imageShadows": "true",
			"textAlignment": "central",
			"buttonStyle": "textOnly",
			"buttonRadius": "15",
			"imageMask": "default",
			"imageRadius": "100",
			"mapPin": "false",
			"mapZoom": "0.0",
			"mapInteractivity": "false",
			"mapSize": "Short",

        ]
    }
}