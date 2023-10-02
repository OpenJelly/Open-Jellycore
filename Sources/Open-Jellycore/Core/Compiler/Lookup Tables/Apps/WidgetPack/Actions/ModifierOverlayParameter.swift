//
//  ModifierOverlayParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierOverlayParameter: ParameterProtocol, Codable {
	var overlayView: Jelly_View?
	var overlayAlignment: Jelly_Alignment?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierOverlayParameter()

        if let value = call.first(where: { node in return node.slotName == "overlayView" }) {
            parameters.overlayView = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierOverlay", name: "overlayView"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overlayAlignment" }) {
            parameters.overlayAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierOverlay", name: "overlayAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierOverlay", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"overlayView": "View(identifier: \"View1\", displayString: \"View One\")",
			"overlayAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
