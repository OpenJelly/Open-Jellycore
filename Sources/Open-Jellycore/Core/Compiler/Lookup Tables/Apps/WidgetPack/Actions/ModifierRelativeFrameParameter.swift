//
//  ModifierRelativeFrameParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierRelativeFrameParameter: ParameterProtocol, Codable {
	var relativeFrameWidth: JellyDouble?
	var relativeFrameHeight: JellyDouble?
	var relativeFrameAlignment: Jelly_Alignment?
	var relativeFrameRelativeTo: Jelly_RelativeFrameRelativeTo?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierRelativeFrameParameter()

        if let value = call.first(where: { node in return node.slotName == "relativeFrameWidth" }) {
            parameters.relativeFrameWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRelativeFrame", name: "relativeFrameWidth"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameHeight" }) {
            parameters.relativeFrameHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRelativeFrame", name: "relativeFrameHeight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameAlignment" }) {
            parameters.relativeFrameAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRelativeFrame", name: "relativeFrameAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameRelativeTo" }) {
            parameters.relativeFrameRelativeTo = Jelly_RelativeFrameRelativeTo(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRelativeFrame", name: "relativeFrameRelativeTo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierRelativeFrame", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"relativeFrameWidth": "1234.3",
			"relativeFrameHeight": "42.42",
			"relativeFrameAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"relativeFrameRelativeTo": "RelativeFrameRelativeTo(identifier: \"Relative\", displayString: \"Relative\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
