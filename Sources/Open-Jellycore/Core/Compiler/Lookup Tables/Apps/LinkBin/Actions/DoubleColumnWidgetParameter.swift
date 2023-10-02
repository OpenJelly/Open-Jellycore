//
//  DoubleColumnWidgetParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DoubleColumnWidgetParameter: ParameterProtocol, Codable {
	var displayFirstColumn: JellyBoolean?
	var firstColumnLabel: Jelly_ShortcutLabel?
	var displaySecondColumn: JellyBoolean?
	var secondColumnLabel: Jelly_ShortcutLabel?
	var includeArchivedLinks: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DoubleColumnWidgetParameter()

        if let value = call.first(where: { node in return node.slotName == "displayFirstColumn" }) {
            parameters.displayFirstColumn = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "doubleColumnWidget", name: "displayFirstColumn"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "firstColumnLabel" }) {
            parameters.firstColumnLabel = Jelly_ShortcutLabel(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "doubleColumnWidget", name: "firstColumnLabel"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "displaySecondColumn" }) {
            parameters.displaySecondColumn = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "doubleColumnWidget", name: "displaySecondColumn"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "secondColumnLabel" }) {
            parameters.secondColumnLabel = Jelly_ShortcutLabel(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "doubleColumnWidget", name: "secondColumnLabel"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeArchivedLinks" }) {
            parameters.includeArchivedLinks = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "doubleColumnWidget", name: "includeArchivedLinks"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"displayFirstColumn": "true",
			"firstColumnLabel": "ShortcutLabel(displayString: \"All Links\")",
			"displaySecondColumn": "true",
			"secondColumnLabel": "ShortcutLabel(displayString: \"All Links\")",
			"includeArchivedLinks": "false",

        ]
    }
}
