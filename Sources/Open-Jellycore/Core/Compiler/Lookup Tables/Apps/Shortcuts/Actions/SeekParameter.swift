//
//  SeekParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SeekParameter: ParameterProtocol, Codable {
	var behavior: Jelly_WFSeekBehavior?
	var WFTimeInterval: ShortcutsQuantity?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SeekParameter()

        if let value = call.first(where: { node in return node.slotName == "behavior" }) {
            parameters.behavior = Jelly_WFSeekBehavior(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "seek", name: "behavior"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "time" }) {
            parameters.WFTimeInterval = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "seek", name: "time"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"behavior": "Forward By",
			"time": "1 minute",

        ]
    }
}