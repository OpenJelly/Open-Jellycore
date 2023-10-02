//
//  SalientCropParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SalientCropParameter: ParameterProtocol, Codable {
	var images: JellyVariableReference?
	var cropType: Jelly_CropType?
	var outputType: Jelly_OutputType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SalientCropParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "images" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.images = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "salientCrop", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "cropType" }) {
            parameters.cropType = Jelly_CropType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "salientCrop", name: "cropType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "outputType" }) {
            parameters.outputType = Jelly_OutputType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "salientCrop", name: "outputType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"images": "ShortcutInput",
			"cropType": "interest",
			"outputType": "cropped",

        ]
    }
}
