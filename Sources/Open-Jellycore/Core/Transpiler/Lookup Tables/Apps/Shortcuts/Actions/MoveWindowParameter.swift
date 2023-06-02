//
//  MoveWindowParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MoveWindowParameter: ParameterProtocol, Codable {
	var WFWindow: JellyVariableReference?
	var position: Jelly_WFPosition?
	var WFBringToFront: JellyBoolean?
	var WFXCoordinate: JellyDouble?
	var WFYCoordinate: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MoveWindowParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "window" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFWindow = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "moveWindow", name: "window"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "position" }) {
            parameters.position = Jelly_WFPosition(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "moveWindow", name: "position"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bringToFront" }) {
            parameters.WFBringToFront = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "moveWindow", name: "bringToFront"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "xCoordinate" }) {
            parameters.WFXCoordinate = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "moveWindow", name: "xCoordinate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "yCoordinate" }) {
            parameters.WFYCoordinate = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "moveWindow", name: "yCoordinate"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"window": "Found Window",
			"position": "Coordinates",
			"bringToFront": "false",
			"xCoordinate": "100",
			"yCoordinate": "100",

        ]
    }
}