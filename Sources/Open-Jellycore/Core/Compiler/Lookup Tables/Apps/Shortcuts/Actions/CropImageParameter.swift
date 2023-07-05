//
//  CropImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CropImageParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var position: Jelly_WFImageCropPosition?
	var WFImageCropHeight: JellyDouble?
	var WFImageCropWidth: JellyDouble?
	var WFImageCropX: JellyDouble?
	var WFImageCropY: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CropImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "cropImage", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "position" }) {
            parameters.position = Jelly_WFImageCropPosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "cropImage", name: "position"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.WFImageCropHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "cropImage", name: "height"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.WFImageCropWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "cropImage", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "x" }) {
            parameters.WFImageCropX = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "cropImage", name: "x"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "y" }) {
            parameters.WFImageCropY = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "cropImage", name: "y"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",
			"position": "Center",
			"height": "128",
			"width": "128",

        ]
    }
}