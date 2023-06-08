//
//  CreateMatteParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateMatteParameter: ParameterProtocol, Codable {
	var width: JellyInteger?
	var height: JellyInteger?
	var colour: Jelly_MatteColours?
	var hexColour: JellyString?
	var transparency: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateMatteParameter()

        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.width = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMatte", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.height = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMatte", name: "height"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "colour" }) {
            parameters.colour = Jelly_MatteColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMatte", name: "colour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hexColour" }) {
            parameters.hexColour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMatte", name: "hexColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "transparency" }) {
            parameters.transparency = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMatte", name: "transparency"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"width": "512",
			"height": "512",
			"colour": "black",
			"hexColour": "",
			"transparency": "0.5",

        ]
    }
}