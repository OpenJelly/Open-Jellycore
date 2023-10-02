//
//  UniversalVariablesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UniversalVariablesParameter: ParameterProtocol, Codable {
	var operation: Jelly_UniversalVariableOperation?
	var setValue: JellyVariableReference?
	var setName: JellyString?
	var setReturnPrevious: JellyBoolean?
	var getName: JellyString?
	var addValue: JellyVariableReference?
	var addName: JellyString?
	var addPosition: Jelly_UniversalVariablesListPosition?
	var deleteName: JellyString?
	var addIndex: JellyInteger?
	var removePosition: Jelly_UniversalVariablesListPosition?
	var removeIndex: JellyInteger?
	var removeName: JellyString?
	var database: Jelly_UniversalVariablesDatabase?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UniversalVariablesParameter()

        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_UniversalVariableOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "operation"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "setValue" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.setValue = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "setValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setName" }) {
            parameters.setName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "setName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setReturnPrevious" }) {
            parameters.setReturnPrevious = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "setReturnPrevious"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getName" }) {
            parameters.getName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "getName"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "addValue" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.addValue = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "addValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addName" }) {
            parameters.addName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "addName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addPosition" }) {
            parameters.addPosition = Jelly_UniversalVariablesListPosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "addPosition"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deleteName" }) {
            parameters.deleteName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "deleteName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addIndex" }) {
            parameters.addIndex = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "addIndex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removePosition" }) {
            parameters.removePosition = Jelly_UniversalVariablesListPosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "removePosition"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeIndex" }) {
            parameters.removeIndex = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "removeIndex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeName" }) {
            parameters.removeName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "removeName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "database" }) {
            parameters.database = Jelly_UniversalVariablesDatabase(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "universalVariables", name: "database"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"operation": "set",
			"setValue": "Clipboard",
			"setName": "Clipboard Value",
			"setReturnPrevious": "true",
			"getName": "\"\"",
			"addValue": "\"\"",
			"addName": "\"\"",
			"addPosition": "\"\"",
			"deleteName": "\"\"",
			"addIndex": "\"\"",
			"removePosition": "\"\"",
			"removeIndex": "\"\"",
			"removeName": "\"\"",
			"database": "public",

        ]
    }
}
