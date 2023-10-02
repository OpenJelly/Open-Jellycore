//
//  MarkdownToHTMLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MarkdownToHTMLParameter: ParameterProtocol, Codable {
	var markdownParser: Jelly_DraftMarkdownParser?
	var content: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MarkdownToHTMLParameter()

        if let value = call.first(where: { node in return node.slotName == "markdownParser" }) {
            parameters.markdownParser = Jelly_DraftMarkdownParser(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "markdownToHTML", name: "markdownParser"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "content" }) {
            parameters.content = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "markdownToHTML", name: "content"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"markdownParser": "multimarkdown",
			"content": "# Hello\n## World\n **This is some markdown**",

        ]
    }
}
