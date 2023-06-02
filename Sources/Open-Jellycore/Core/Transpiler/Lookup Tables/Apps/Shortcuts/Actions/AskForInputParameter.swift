//
//  AskForInputParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AskForInputParameter: ParameterProtocol, Codable {
	var WFAskActionPrompt: JellyString?
	var type: Jelly_WFInputType?
	var WFAskActionDefaultAnswer: Jelly_WFAskActionDefaultAnswer?
	var WFAskActionAllowsDecimalNumbers: JellyBoolean?
	var WFAskActionAllowsNegativeNumbers: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AskForInputParameter()

        if let value = call.first(where: { node in return node.slotName == "prompt" }) {
            parameters.WFAskActionPrompt = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "askForInput", name: "prompt"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFInputType(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "askForInput", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "default" }) {
            parameters.WFAskActionDefaultAnswer = Jelly_WFAskActionDefaultAnswer(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "askForInput", name: "default"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "allowDecimal" }) {
            parameters.WFAskActionAllowsDecimalNumbers = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "askForInput", name: "allowDecimal"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "allowNegative" }) {
            parameters.WFAskActionAllowsNegativeNumbers = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "askForInput", name: "allowNegative"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"prompt": "How old are you?",
			"type": "Number",
			"default": "12",
			"allowDecimal": "true",
			"allowNegative": "false",

        ]
    }
}