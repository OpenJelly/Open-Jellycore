//
//  SetDraftParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetDraftParameter: ParameterProtocol, Codable {
	var draft: Jelly_Draft?
	var content: JellyString?
	var writeType: Jelly_DraftWriteType?
	var tags: JellyArray<JellyVariableReference>?
	var folder: Jelly_DraftUpdateFolder?
	var isFlagged: Jelly_DraftUpdateFlaggedStatus?
	var grammarType: Jelly_GrammarType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetDraftParameter()

        if let value = call.first(where: { node in return node.slotName == "draft" }) {
            parameters.draft = Jelly_Draft(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "draft"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "content" }) {
            parameters.content = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "content"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "writeType" }) {
            parameters.writeType = Jelly_DraftWriteType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "writeType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tags" }) {
            parameters.tags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "tags"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "folder" }) {
            parameters.folder = Jelly_DraftUpdateFolder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "folder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isFlagged" }) {
            parameters.isFlagged = Jelly_DraftUpdateFlaggedStatus(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "isFlagged"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "grammarType" }) {
            parameters.grammarType = Jelly_GrammarType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setDraft", name: "grammarType"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"draft": "Draft(identifier: \"F5BD82B1BA4\", displayString: \"Default Draft\", uuid: \"F5BD82B1BA4\", link: \"drafts://open?uuid=F5BD82B1BA4\", content: \"Some really cool content\", title: \"Default Draft\", tags: [\"Default Draft\"], folder: inbox, isFlagged: false, grammarType: GrammarType(displayString: \"Markdown\", identifier: \"Markdown\"))",
			"content": "Hello World!",
			"writeType": "replace",
			"tags": "[\"Jellycuts Drafts\"]",
			"folder": "inbox",
			"isFlagged": "flagged",
			"grammarType": "GrammarType(displayString: \"Markdown\", identifier: \"Markdown\"))",

        ]
    }
}
