//
//  BlurImagesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct BlurImagesParameter: ParameterProtocol, Codable {
	var images: JellyVariableReference?
	var blurType: Jelly_BlurFilterType?
	var pixellateStrength: JellyDouble?
	var gaussianStrength: JellyDouble?
	var boxStrength: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = BlurImagesParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "images" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.images = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "blurImages", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "blurType" }) {
            parameters.blurType = Jelly_BlurFilterType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "blurImages", name: "blurType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pixellateStrength" }) {
            parameters.pixellateStrength = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "blurImages", name: "pixellateStrength"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "gaussianStrength" }) {
            parameters.gaussianStrength = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "blurImages", name: "gaussianStrength"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "boxStrength" }) {
            parameters.boxStrength = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "blurImages", name: "boxStrength"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"images": "ShortcutInput",
			"blurType": "Gaussian",
			"pixellateStrength": "10",
			"gaussianStrength": "2",
			"boxStrength": "",

        ]
    }
}