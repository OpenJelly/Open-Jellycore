//
//  AddLinkParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddLinkParameter: ParameterProtocol, Codable {
	var url: JellyString?
	var label: Jelly_ShortcutLabel?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddLinkParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addLink", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "label" }) {
            parameters.label = Jelly_ShortcutLabel(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addLink", name: "label"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycuts.com",
			"label": "ShortcutLabel(displayString: \"All Links\")",

        ]
    }
}
