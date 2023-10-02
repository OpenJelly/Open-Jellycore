//
//  Actions_ShuffleListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_ShuffleListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var shouldLimit: JellyBoolean?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_ShuffleListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "shuffleList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shouldLimit" }) {
            parameters.shouldLimit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "shuffleList", name: "shouldLimit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "shuffleList", name: "limit"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[ShortcutInput, CurrentDate, Clipboard]",
			"shouldLimit": "true",
			"limit": "1",

        ]
    }
}
