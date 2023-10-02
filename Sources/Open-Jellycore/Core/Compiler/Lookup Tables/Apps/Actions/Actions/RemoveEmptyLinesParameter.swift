//
//  RemoveEmptyLinesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveEmptyLinesParameter: ParameterProtocol, Codable {
	var text: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveEmptyLinesParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeEmptyLines", name: "text"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "\"${ShortcutInput}\"",

        ]
    }
}
