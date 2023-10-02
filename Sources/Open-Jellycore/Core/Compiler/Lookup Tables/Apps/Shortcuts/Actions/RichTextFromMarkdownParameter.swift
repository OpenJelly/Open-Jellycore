//
//  RichTextFromMarkdownParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RichTextFromMarkdownParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RichTextFromMarkdownParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "markdown" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "richTextFromMarkdown", name: "markdown"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"markdown": "Rich Text",

        ]
    }
}
