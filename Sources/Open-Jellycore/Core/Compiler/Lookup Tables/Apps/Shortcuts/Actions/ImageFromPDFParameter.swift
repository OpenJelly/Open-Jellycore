//
//  ImageFromPDFParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ImageFromPDFParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFMakeImageFromPDFPageImageFormat: Jelly_WFMakeImageFromPDFPageImageFormat?
	var colorspace: Jelly_WFMakeImageFromPDFPageColorspace?
	var WFMakeImageFromPDFPageResolution: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ImageFromPDFParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "pdf" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "imageFromPDF", name: "pdf"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.WFMakeImageFromPDFPageImageFormat = Jelly_WFMakeImageFromPDFPageImageFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "imageFromPDF", name: "format"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "colorspace" }) {
            parameters.colorspace = Jelly_WFMakeImageFromPDFPageColorspace(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "imageFromPDF", name: "colorspace"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resolution" }) {
            parameters.WFMakeImageFromPDFPageResolution = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "imageFromPDF", name: "resolution"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"pdf": "ShortcutInput",
			"format": "PDF",
			"colorspace": "RGB",
			"resolution": "300",

        ]
    }
}