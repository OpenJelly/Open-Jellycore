//
//  RandomTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RandomTextParameter: ParameterProtocol, Codable {
	var length: JellyInteger?
	var useCustomCharacters: JellyBoolean?
	var useLowercase: JellyBoolean?
	var useUppercase: JellyBoolean?
	var useDigits: JellyBoolean?
	var customCharacters: JellyString?
	var seed: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RandomTextParameter()

        if let value = call.first(where: { node in return node.slotName == "length" }) {
            parameters.length = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "length"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useCustomCharacters" }) {
            parameters.useCustomCharacters = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "useCustomCharacters"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useLowercase" }) {
            parameters.useLowercase = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "useLowercase"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useUppercase" }) {
            parameters.useUppercase = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "useUppercase"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useDigits" }) {
            parameters.useDigits = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "useDigits"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customCharacters" }) {
            parameters.customCharacters = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "customCharacters"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "seed" }) {
            parameters.seed = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomText", name: "seed"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"length": "25",
			"useCustomCharacters": "true",
			"useLowercase": "true",
			"useUppercase": "true",
			"useDigits": "true",
			"customCharacters": "\"-\"",
			"seed": "Jellycts!",

        ]
    }
}