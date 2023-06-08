//
//  ResizeWindowParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ResizeWindowParameter: ParameterProtocol, Codable {
	var WFWindow: JellyVariableReference?
	var config: Jelly_WFConfiguration?
	var WFBringToFront: JellyBoolean?
	var WFHeight: JellyDouble?
	var WFWidth: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ResizeWindowParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "window" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFWindow = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeWindow", name: "window"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "config" }) {
            parameters.config = Jelly_WFConfiguration(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeWindow", name: "config"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bringToFront" }) {
            parameters.WFBringToFront = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeWindow", name: "bringToFront"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.WFHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeWindow", name: "height"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.WFWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "resizeWindow", name: "width"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"window": "Found Window",
			"config": "Dimensions",
			"bringToFront": "false",
			"height": "100",
			"width": "100",

        ]
    }
}