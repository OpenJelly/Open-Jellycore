//
//  WriteTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct WriteTextParameter: ParameterProtocol, Codable {
	var shouldEdit: JellyBoolean?
	var text: JellyString?
	var editorTitle: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = WriteTextParameter()

        if let value = call.first(where: { node in return node.slotName == "shouldEdit" }) {
            parameters.shouldEdit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "writeText", name: "shouldEdit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "writeText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "editorTitle" }) {
            parameters.editorTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "writeText", name: "editorTitle"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"shouldEdit": "true",
			"text": "Jellycuts is awesome!",
			"editorTitle": "Super Document",

        ]
    }
}