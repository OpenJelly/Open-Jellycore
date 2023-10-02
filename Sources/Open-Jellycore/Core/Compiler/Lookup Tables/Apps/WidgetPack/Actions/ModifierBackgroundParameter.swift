//
//  ModifierBackgroundParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierBackgroundParameter: ParameterProtocol, Codable {
	var backgroundView: Jelly_View?
	var backgroundAlignment: Jelly_Alignment?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierBackgroundParameter()

        if let value = call.first(where: { node in return node.slotName == "backgroundView" }) {
            parameters.backgroundView = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierBackground", name: "backgroundView"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundAlignment" }) {
            parameters.backgroundAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierBackground", name: "backgroundAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierBackground", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"backgroundView": "View(identifier: \"View1\", displayString: \"View One\")",
			"backgroundAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
