//
//  ScaleImagesIAIHParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ScaleImagesIAIHParameter: ParameterProtocol, Codable {
	var images: JellyVariableReference?
	var scaleMode: Jelly_ScaleMode?
	var pixelSize: JellyInteger?
	var includeAlpha: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ScaleImagesIAIHParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "images" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.images = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "scaleImagesIAIH", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scaleMode" }) {
            parameters.scaleMode = Jelly_ScaleMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "scaleImagesIAIH", name: "scaleMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pixelSize" }) {
            parameters.pixelSize = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "scaleImagesIAIH", name: "pixelSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeAlpha" }) {
            parameters.includeAlpha = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "scaleImagesIAIH", name: "includeAlpha"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"images": "ShortctInput",
			"scaleMode": "longestEdge",
			"pixelSize": "300",
			"includeAlpha": "true",

        ]
    }
}