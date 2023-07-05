//
//  CombineImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CombineImageParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var mode: Jelly_WFImageCombineMode?
	var WFImageCombineSpacing: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CombineImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "images" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineImage", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_WFImageCombineMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineImage", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "spacing" }) {
            parameters.WFImageCombineSpacing = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineImage", name: "spacing"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"images": "imageList",
			"mode": "Vertically",
			"spacing": "10",

        ]
    }
}