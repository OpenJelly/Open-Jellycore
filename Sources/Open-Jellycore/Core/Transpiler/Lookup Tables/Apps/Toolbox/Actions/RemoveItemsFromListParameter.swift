//
//  RemoveItemsFromListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveItemsFromListParameter: ParameterProtocol, Codable {
	var list: JellyVariableReference?
	var mode: Jelly_RemoveFromListMode?
	var indexes: JellyArray<JellyVariableReference>?
	var rangeStart: JellyInteger?
	var rangeEnd: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveItemsFromListParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "list" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.list = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeItemsFromList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_RemoveFromListMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeItemsFromList", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "indexes" }) {
            parameters.indexes = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeItemsFromList", name: "indexes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rangeStart" }) {
            parameters.rangeStart = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeItemsFromList", name: "rangeStart"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rangeEnd" }) {
            parameters.rangeEnd = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeItemsFromList", name: "rangeEnd"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "ShortcutInput",
			"mode": "itemsAtPositions",
			"indexes": "[0, 1, 4]",
			"rangeStart": "",
			"rangeEnd": "",

        ]
    }
}