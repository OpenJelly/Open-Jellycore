//
//  AddFrameToGIFParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddFrameToGIFParameter: ParameterProtocol, Codable {
	var WFImage: JellyVariableReference?
	var WFInputGIF: JellyVariableReference?
	var WFGIFDelayTime: JellyDouble?
	var WFGIFAutoSize: JellyBoolean?
	var WFGIFManualSizeWidth: JellyDouble?
	var WFGIFManualSizeHeight: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddFrameToGIFParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "photo" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addFrameToGIF", name: "photo"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "gif" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInputGIF = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addFrameToGIF", name: "gif"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "delay" }) {
            parameters.WFGIFDelayTime = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addFrameToGIF", name: "delay"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "autoSize" }) {
            parameters.WFGIFAutoSize = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addFrameToGIF", name: "autoSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.WFGIFManualSizeWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addFrameToGIF", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.WFGIFManualSizeHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addFrameToGIF", name: "height"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"photo": "ShortcutInput",
			"gif": "GIF",
			"delay": "0.25",
			"autoSize": "false",
			"width": "500",
			"height": "500",

        ]
    }
}
