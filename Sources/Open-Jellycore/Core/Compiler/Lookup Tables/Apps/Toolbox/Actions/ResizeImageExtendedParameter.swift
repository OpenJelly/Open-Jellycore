//
//  ResizeImageExtendedParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ResizeImageExtendedParameter: ParameterProtocol, Codable {
	var image: JellyVariableReference?
	var resizeMode: Jelly_ResizeMode?
	var longestEdge: JellyInteger?
	var shortestEdge: JellyInteger?
	var includeAlpha: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ResizeImageExtendedParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeImageExtended", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resizeMode" }) {
            parameters.resizeMode = Jelly_ResizeMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeImageExtended", name: "resizeMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "longestEdge" }) {
            parameters.longestEdge = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeImageExtended", name: "longestEdge"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shortestEdge" }) {
            parameters.shortestEdge = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeImageExtended", name: "shortestEdge"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeAlpha" }) {
            parameters.includeAlpha = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeImageExtended", name: "includeAlpha"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",
			"resizeMode": "SetLongestEdge",
			"longestEdge": "10",
			"shortestEdge": "5",
			"includeAlpha": "true",

        ]
    }
}