//
//  GetItemFromListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetItemFromListParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var type: Jelly_WFItemSpecifier?
	var WFItemIndex: JellyString?
	var WFItemRangeStart: JellyString?
	var WFItemRangeEnd: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetItemFromListParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "list" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getItemFromList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFItemSpecifier(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getItemFromList", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "index" }) {
            parameters.WFItemIndex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getItemFromList", name: "index"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startIndex" }) {
            parameters.WFItemRangeStart = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getItemFromList", name: "startIndex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "endIndex" }) {
            parameters.WFItemRangeEnd = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getItemFromList", name: "endIndex"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "options",
			"type": "Item at Index",
			"index": "3",
			"startIndex": "",
			"endIndex": "",

        ]
    }
}