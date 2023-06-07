//
//  CombineListsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CombineListsParameter: ParameterProtocol, Codable {
	var firstList: JellyArray<JellyVariableReference>?
	var secondList: JellyArray<JellyVariableReference>?
	var operation: Jelly_CombineListsOperation?
	var removeDuplicates: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CombineListsParameter()

        if let value = call.first(where: { node in return node.slotName == "firstList" }) {
            parameters.firstList = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "firstList"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "secondList" }) {
            parameters.secondList = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "secondList"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_CombineListsOperation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "operation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "removeDuplicates" }) {
            parameters.removeDuplicates = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "combineLists", name: "removeDuplicates"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"firstList": "ListOne",
			"secondList": "ListTwo",
			"operation": "join",
			"removeDuplicates": "true",

        ]
    }
}