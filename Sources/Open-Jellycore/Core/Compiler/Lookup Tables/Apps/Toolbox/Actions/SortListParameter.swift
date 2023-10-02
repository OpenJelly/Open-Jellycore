//
//  SortListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SortListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var sortOrder: Jelly_SortOrder?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SortListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "sortList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortOrder" }) {
            parameters.sortOrder = Jelly_SortOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "sortList", name: "sortOrder"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "ShortcutInput",
			"sortOrder": "az",

        ]
    }
}
