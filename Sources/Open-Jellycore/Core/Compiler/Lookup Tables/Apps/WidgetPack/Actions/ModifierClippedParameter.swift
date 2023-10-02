//
//  ModifierClippedParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierClippedParameter: ParameterProtocol, Codable {
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierClippedParameter()

        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "modifierClipped", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
