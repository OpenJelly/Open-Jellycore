//
//  OpenDraftParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenDraftParameter: ParameterProtocol, Codable {
	var draft: Jelly_Draft?
	var draftList: Jelly_ShowHideStatus?
	var actionList: Jelly_ShowHideStatus?
	var loadWorkspace: Jelly_Workspace?
	var loadActionGroup: Jelly_ActionGroup?
	var loadActionBarGroup: Jelly_ActionGroup?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenDraftParameter()

        if let value = call.first(where: { node in return node.slotName == "draft" }) {
            parameters.draft = Jelly_Draft(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openDraft", name: "draft"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "draftList" }) {
            parameters.draftList = Jelly_ShowHideStatus(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openDraft", name: "draftList"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "actionList" }) {
            parameters.actionList = Jelly_ShowHideStatus(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openDraft", name: "actionList"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "loadWorkspace" }) {
            parameters.loadWorkspace = Jelly_Workspace(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openDraft", name: "loadWorkspace"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "loadActionGroup" }) {
            parameters.loadActionGroup = Jelly_ActionGroup(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openDraft", name: "loadActionGroup"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "loadActionBarGroup" }) {
            parameters.loadActionBarGroup = Jelly_ActionGroup(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openDraft", name: "loadActionBarGroup"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"draft": "Draft(identifier: \"F5BD82B1BA4\", displayString: \"Default Draft\", uuid: \"F5BD82B1BA4\", link: \"drafts://open?uuid=F5BD82B1BA4\", content: \"Some really cool content\", title: \"Default Draft\", tags: [\"Default Draft\"], folder: inbox, isFlagged: false, grammarType: GrammarType(displayString: \"Markdown\", identifier: \"Markdown\"))",
			"draftList": "show",
			"actionList": "show",
			"loadWorkspace": "Workspace(identifier: \"Default\", displayString: \"Default\", name: \"Default\")",
			"loadActionGroup": "ActionGroup(identifier: \"132123-213213\", displayString: \"Editing\", name: \"Editing\")",
			"loadActionBarGroup": "ActionGroup(identifier: \"qiue9313\", displayString: \"Tools\", name: \"Tools\")",

        ]
    }
}
