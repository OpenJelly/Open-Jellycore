//
//  GenerateThumbnailsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GenerateThumbnailsParameter: ParameterProtocol, Codable {
	var files: JellyVariableReference?
	var outputType: Jelly_ThumbsOutputType?
	var withPreviews: JellyBoolean?
	var backgroundColour: Jelly_BackgroundColours?
	var hexCode: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GenerateThumbnailsParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "files" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.files = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateThumbnails", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "outputType" }) {
            parameters.outputType = Jelly_ThumbsOutputType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateThumbnails", name: "outputType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "withPreviews" }) {
            parameters.withPreviews = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateThumbnails", name: "withPreviews"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundColour" }) {
            parameters.backgroundColour = Jelly_BackgroundColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateThumbnails", name: "backgroundColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hexCode" }) {
            parameters.hexCode = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "generateThumbnails", name: "hexCode"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "ShortcutInput",
			"outputType": "Images",
			"withPreviews": "false",
			"backgroundColour": "clear",
			"hexCode": "#f7f7f7",

        ]
    }
}