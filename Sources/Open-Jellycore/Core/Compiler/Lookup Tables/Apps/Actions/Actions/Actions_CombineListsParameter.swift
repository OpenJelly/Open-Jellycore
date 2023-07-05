//
//  Actions_CombineListsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_CombineListsParameter: ParameterProtocol, Codable {
	var list1: JellyArray<JellyVariableReference>?
	var list2: JellyArray<JellyVariableReference>?
	var list3: JellyArray<JellyVariableReference>?
	var list4: JellyArray<JellyVariableReference>?
	var list5: JellyVariableReference?
	var list6: JellyArray<JellyVariableReference>?
	var list7: JellyArray<JellyVariableReference>?
	var list8: JellyArray<JellyVariableReference>?
	var list9: JellyArray<JellyVariableReference>?
	var list10: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_CombineListsParameter()

        if let value = call.first(where: { node in return node.slotName == "list1" }) {
            parameters.list1 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list2" }) {
            parameters.list2 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list3" }) {
            parameters.list3 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list3"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list4" }) {
            parameters.list4 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list4"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "list5" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.list5 = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list5"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list6" }) {
            parameters.list6 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list6"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list7" }) {
            parameters.list7 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list7"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list8" }) {
            parameters.list8 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list8"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list9" }) {
            parameters.list9 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list9"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "list10" }) {
            parameters.list10 = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "list10"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list1": "ShortcutInput",
			"list2": "[Clipboard]",
			"list3": "[CurrentDate]",
			"list4": "ShortcutInput",
			"list5": "ShortcutInput",
			"list6": "ShortcutInput",
			"list7": "ShortcutInput",
			"list8": "ShortcutInput",
			"list9": "ShortcutInput",
			"list10": "ShortcutInput",

        ]
    }
}
