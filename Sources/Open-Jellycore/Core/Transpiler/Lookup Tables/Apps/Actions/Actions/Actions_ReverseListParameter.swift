//
//  Actions_ReverseListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_ReverseListParameter: ParameterProtocol, Codable {
	var list: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_ReverseListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.list = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "reverseList", name: "list"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "[ShortcutInput, CurrentDate, Clipboard]",

        ]
    }
}
