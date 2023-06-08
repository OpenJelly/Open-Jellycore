//
//  CaptureParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CaptureParameter: ParameterProtocol, Codable {
	var content: JellyString?
	var tags: JellyArray<JellyVariableReference>?
	var folder: Jelly_DraftUpdateFolder?
	var isFlagged: Jelly_DraftUpdateFlaggedStatus?
	var grammarType: Jelly_GrammarType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CaptureParameter()

        if let value = call.first(where: { node in return node.slotName == "content" }) {
            parameters.content = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "capture", name: "content"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tags" }) {
            parameters.tags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "capture", name: "tags"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "folder" }) {
            parameters.folder = Jelly_DraftUpdateFolder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "capture", name: "folder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isFlagged" }) {
            parameters.isFlagged = Jelly_DraftUpdateFlaggedStatus(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "capture", name: "isFlagged"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "grammarType" }) {
            parameters.grammarType = Jelly_GrammarType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "capture", name: "grammarType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"content": "Hello World!",
			"tags": "[\"Jellycuts Drafts\"]",
			"folder": "inbox",
			"isFlagged": "flagged",
			"grammarType": "GrammarType(displayString: \"Markdown\", identifier: \"Markdown\"))",

        ]
    }
}
