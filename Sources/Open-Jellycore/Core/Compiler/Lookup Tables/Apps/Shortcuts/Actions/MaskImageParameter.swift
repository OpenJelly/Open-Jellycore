//
//  MaskImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MaskImageParameter: ParameterProtocol, Codable {
	var WFImage: JellyVariableReference?
	var mode: Jelly_WFMaskType?
	var WFCustomMaskImage: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MaskImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "maskImage", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_WFMaskType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "maskImage", name: "mode"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "mask" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFCustomMaskImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "maskImage", name: "mask"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",
			"mode": "Icon",
			"mask": "Clipboard",

        ]
    }
}
