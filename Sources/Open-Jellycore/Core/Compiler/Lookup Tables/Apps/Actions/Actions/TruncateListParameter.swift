//
//  TruncateListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TruncateListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TruncateListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "truncateList", name: "list"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "truncateList", name: "limit"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[ShortcutInput, CurrentDate, Clipboard]",
			"limit": "1",

        ]
    }
}
