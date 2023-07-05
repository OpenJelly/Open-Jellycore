//
//  PluraliseParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PluraliseParameter: ParameterProtocol, Codable {
	var word: JellyString?
	var countType: Jelly_CountType?
	var items: JellyVariableReference?
	var count: JellyInteger?
	var output: Jelly_PluraliseOutput?
	var typeCase: Jelly_PluraliseCase?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PluraliseParameter()

        if let value = call.first(where: { node in return node.slotName == "word" }) {
            parameters.word = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pluralise", name: "word"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "countType" }) {
            parameters.countType = Jelly_CountType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pluralise", name: "countType"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "items" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.items = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pluralise", name: "items"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.count = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pluralise", name: "count"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "output" }) {
            parameters.output = Jelly_PluraliseOutput(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pluralise", name: "output"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "typeCase" }) {
            parameters.typeCase = Jelly_PluraliseCase(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pluralise", name: "typeCase"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"word": "\"Jellycuts\"",
			"countType": "items",
			"items": "ShortcutInput",
			"count": "",
			"output": "word",
			"typeCase": "sentence",

        ]
    }
}