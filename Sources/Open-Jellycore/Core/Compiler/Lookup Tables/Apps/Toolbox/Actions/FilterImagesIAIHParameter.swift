//
//  FilterImagesIAIHParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FilterImagesIAIHParameter: ParameterProtocol, Codable {
	var filter: JellyString?
	var images: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FilterImagesIAIHParameter()

        if let value = call.first(where: { node in return node.slotName == "filter" }) {
            parameters.filter = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImagesIAIH", name: "filter"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "images" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.images = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImagesIAIH", name: "images"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"filter": "Chrome",
			"images": "ShortcutInput",

        ]
    }
}