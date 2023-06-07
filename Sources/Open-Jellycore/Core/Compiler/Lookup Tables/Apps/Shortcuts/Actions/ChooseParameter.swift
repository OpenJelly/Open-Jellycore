//
//  ChooseParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ChooseParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFChooseFromListActionPrompt: JellyString?
	var WFChooseFromListActionSelectMultiple: JellyBoolean?
	var WFChooseFromListActionSelectAll: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ChooseParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "list" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "choose", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "prompt" }) {
            parameters.WFChooseFromListActionPrompt = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "choose", name: "prompt"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "multiple" }) {
            parameters.WFChooseFromListActionSelectMultiple = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "choose", name: "multiple"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "all" }) {
            parameters.WFChooseFromListActionSelectAll = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "choose", name: "all"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "Menu",
			"prompt": "Choose an option",
			"multiple": "true",
			"all": "false",

        ]
    }
}