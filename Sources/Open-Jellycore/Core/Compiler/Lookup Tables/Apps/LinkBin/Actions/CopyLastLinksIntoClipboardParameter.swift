//
//  CopyLastLinksIntoClipboardParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CopyLastLinksIntoClipboardParameter: ParameterProtocol, Codable {
	var sortCriteria: Jelly_ShortcutLinkSortCriteria?
	var sortOrder: Jelly_ShortcutLinkOrderCriteria?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CopyLastLinksIntoClipboardParameter()

        if let value = call.first(where: { node in return node.slotName == "sortCriteria" }) {
            parameters.sortCriteria = Jelly_ShortcutLinkSortCriteria(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "copyLastLinksIntoClipboard", name: "sortCriteria"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sortOrder" }) {
            parameters.sortOrder = Jelly_ShortcutLinkOrderCriteria(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "copyLastLinksIntoClipboard", name: "sortOrder"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"sortCriteria": "addedAt",
			"sortOrder": "descending",

        ]
    }
}
