//
//  OverlayImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OverlayImageParameter: ParameterProtocol, Codable {
	var WFImage: JellyVariableReference?
	var WFInput: JellyVariableReference?
	var WFShouldShowImageEditor: JellyBoolean?
	var WFImageHeight: JellyString?
	var WFImageWidth: JellyString?
	var WFImagePosition: Jelly_WFImagePosition?
	var WFOverlayImageOpacity: JellyString?
	var WFRotation: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OverlayImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image1" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "image1"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "image2" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "image2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "editor" }) {
            parameters.WFShouldShowImageEditor = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "editor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.WFImageHeight = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "height"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.WFImageWidth = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "position" }) {
            parameters.WFImagePosition = Jelly_WFImagePosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "position"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "opacity" }) {
            parameters.WFOverlayImageOpacity = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "opacity"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rotation" }) {
            parameters.WFRotation = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayImage", name: "rotation"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image1": "Profile Image",
			"image2": "Background",
			"editor": "false",
			"height": "512",
			"width": "512",
			"position": "Center",
			"opacity": "1.0",
			"rotation": "180",

        ]
    }
}