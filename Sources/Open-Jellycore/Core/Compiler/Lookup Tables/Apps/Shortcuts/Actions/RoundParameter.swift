//
//  RoundParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RoundParameter: ParameterProtocol, Codable {
	var WFInput: JellyDouble?
	var roundTo: Jelly_WFRoundTo?
	var mode: Jelly_WFRoundMode?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RoundParameter()

        if let value = call.first(where: { node in return node.slotName == "number" }) {
            parameters.WFInput = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "round", name: "number"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "roundTo" }) {
            parameters.roundTo = Jelly_WFRoundTo(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "round", name: "roundTo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_WFRoundMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "round", name: "mode"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"number": "120.3323",
			"roundTo": "Ones Place",
			"mode": "Normal",

        ]
    }
}
