//
//  RemoveFromListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveFromListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var action: Jelly_RemoveFromListAction?
	var index: JellyInteger?
	var rangeLowerBound: JellyInteger?
	var rangeUpperBound: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveFromListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeFromList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "action" }) {
            parameters.action = Jelly_RemoveFromListAction(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeFromList", name: "action"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "index" }) {
            parameters.index = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeFromList", name: "index"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rangeLowerBound" }) {
            parameters.rangeLowerBound = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeFromList", name: "rangeLowerBound"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rangeUpperBound" }) {
            parameters.rangeUpperBound = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeFromList", name: "rangeUpperBound"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[ShortcutInput, Clibpoard, CurrentDate]",
			"action": "index",
			"index": "2",
			"rangeLowerBound": "2",
			"rangeUpperBound": "2",

        ]
    }
}