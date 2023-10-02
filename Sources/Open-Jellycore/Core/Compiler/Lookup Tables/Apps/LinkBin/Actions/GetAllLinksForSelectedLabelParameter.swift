//
//  GetAllLinksForSelectedLabelParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetAllLinksForSelectedLabelParameter: ParameterProtocol, Codable {
	var label: Jelly_ShortcutLabel?
	var includeArchivedLinks: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetAllLinksForSelectedLabelParameter()

        if let value = call.first(where: { node in return node.slotName == "label" }) {
            parameters.label = Jelly_ShortcutLabel(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getAllLinksForSelectedLabel", name: "label"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeArchivedLinks" }) {
            parameters.includeArchivedLinks = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getAllLinksForSelectedLabel", name: "includeArchivedLinks"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"label": "ShortcutLabel(displayString: \"All Links\")",
			"includeArchivedLinks": "false",

        ]
    }
}
