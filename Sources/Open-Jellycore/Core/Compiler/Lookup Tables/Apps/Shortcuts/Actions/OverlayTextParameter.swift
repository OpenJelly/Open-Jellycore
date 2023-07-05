//
//  OverlayTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OverlayTextParameter: ParameterProtocol, Codable {
	var WFImage: JellyVariableReference?
	var WFText: JellyString?
	var position: Jelly_WFTextPosition?
	var WFImageX: JellyDouble?
	var WFImageY: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OverlayTextParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayText", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "position" }) {
            parameters.position = Jelly_WFTextPosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayText", name: "position"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "xCoordinate" }) {
            parameters.WFImageX = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayText", name: "xCoordinate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "yCoordinate" }) {
            parameters.WFImageY = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "overlayText", name: "yCoordinate"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "Clipboard",
			"text": "Jellycuts is awesome!",
			"position": "Custom",
			"xCoordinate": "100",
			"yCoordinate": "100",

        ]
    }
}