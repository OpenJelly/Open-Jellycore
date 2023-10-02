//
//  StartFocusSessionParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct StartFocusSessionParameter: ParameterProtocol, Codable {
	var focusSession: Jelly_FocusSession?
	var focus: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = StartFocusSessionParameter()

        if let value = call.first(where: { node in return node.slotName == "focusSession" }) {
            parameters.focusSession = Jelly_FocusSession(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "startFocusSession", name: "focusSession"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "focus" }) {
            parameters.focus = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "startFocusSession", name: "focus"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"focusSession": "⚠️ Default for FocusSession needed ⚠️",
			"focus": "Set your focus",

        ]
    }
}
