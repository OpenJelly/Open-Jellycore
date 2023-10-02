//
//  AddToListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddToListParameter: ParameterProtocol, Codable {
	var item: JellyVariableReference?
	var list: JellyVariableReference?
	var place: Jelly_ListPlacement?
	var index: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddToListParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "item" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.item = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "item"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "list" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.list = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "place" }) {
            parameters.place = Jelly_ListPlacement(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "place"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "index" }) {
            parameters.index = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addToList", name: "index"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"item": "ShortcutInput",
			"list": "MyList",
			"place": "index",
			"index": "10",

        ]
    }
}
