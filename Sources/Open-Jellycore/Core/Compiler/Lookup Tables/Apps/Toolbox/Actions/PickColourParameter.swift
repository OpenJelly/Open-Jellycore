//
//  PickColourParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PickColourParameter: ParameterProtocol, Codable {
	var image: JellyVariableReference?
	var startingHex: JellyString?
	var postURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PickColourParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pickColour", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startingHex" }) {
            parameters.startingHex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pickColour", name: "startingHex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "postURL" }) {
            parameters.postURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pickColour", name: "postURL"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",
			"startingHex": "\"FFFFFF\"",
			"postURL": "\"shortcuts://\"",

        ]
    }
}