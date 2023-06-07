//
//  ConvertImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ConvertImageParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var format: Jelly_WFImageFormat?
	var WFImagePreserveMetadata: JellyBoolean?
	var WFImageCompressionQuality: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ConvertImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "convertImage", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.format = Jelly_WFImageFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "convertImage", name: "format"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "metadata" }) {
            parameters.WFImagePreserveMetadata = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "convertImage", name: "metadata"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "quality" }) {
            parameters.WFImageCompressionQuality = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "convertImage", name: "quality"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "Clipboard",
			"format": "JPEG",
			"metadata": "true",
			"quality": "0.433",

        ]
    }
}