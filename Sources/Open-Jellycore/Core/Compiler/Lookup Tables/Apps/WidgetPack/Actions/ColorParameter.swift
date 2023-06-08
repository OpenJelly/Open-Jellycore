//
//  ColorParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ColorParameter: ParameterProtocol, Codable {
	var kind: Jelly_ColorKind?
	var hex: JellyString?
	var customRed: JellyDouble?
	var customGreen: JellyDouble?
	var customBlue: JellyDouble?
	var opacity: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ColorParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_ColorKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "color", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hex" }) {
            parameters.hex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "color", name: "hex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customRed" }) {
            parameters.customRed = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "color", name: "customRed"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customGreen" }) {
            parameters.customGreen = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "color", name: "customGreen"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customBlue" }) {
            parameters.customBlue = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "color", name: "customBlue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "opacity" }) {
            parameters.opacity = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "color", name: "opacity"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "accentColor",
			"hex": "\"\"",
			"customRed": "0.0",
			"customGreen": "0.0",
			"customBlue": "0.0",
			"opacity": "100",

        ]
    }
}