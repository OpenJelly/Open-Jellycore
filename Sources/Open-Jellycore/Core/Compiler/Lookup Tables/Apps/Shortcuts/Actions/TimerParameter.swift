//
//  TimerParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TimerParameter: ParameterProtocol, Codable {
	var WFDuration: ShortcutsQuantity?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TimerParameter()

        if let value = call.first(where: { node in return node.slotName == "duration" }) {
            parameters.WFDuration = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "timer", name: "duration"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"duration": "10 min",

        ]
    }
}