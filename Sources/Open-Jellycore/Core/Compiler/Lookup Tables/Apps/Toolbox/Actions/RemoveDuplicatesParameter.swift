//
//  RemoveDuplicatesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveDuplicatesParameter: ParameterProtocol, Codable {
	var items: JellyVariableReference?
	var limitResults: JellyBoolean?
	var resultCount: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveDuplicatesParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "items" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.items = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeDuplicates", name: "items"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limitResults" }) {
            parameters.limitResults = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeDuplicates", name: "limitResults"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resultCount" }) {
            parameters.resultCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeDuplicates", name: "resultCount"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"items": "ShortcutInput",
			"limitResults": "true",
			"resultCount": "5",

        ]
    }
}
