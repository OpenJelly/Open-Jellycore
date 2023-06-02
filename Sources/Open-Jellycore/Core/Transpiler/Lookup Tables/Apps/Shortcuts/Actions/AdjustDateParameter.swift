//
//  AdjustDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AdjustDateParameter: ParameterProtocol, Codable {
	var operation: Jelly_WFAdjustOperation?
	var WFDuration: ShortcutsQuantity?
	var WFDate: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AdjustDateParameter()

        if let value = call.first(where: { node in return node.slotName == "operation" }) {
            parameters.operation = Jelly_WFAdjustOperation(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "adjustDate", name: "operation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "duration" }) {
            parameters.WFDuration = ShortcutsQuantity(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "adjustDate", name: "duration"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.WFDate = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "adjustDate", name: "date"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"operation": "Add",
			"duration": "10 min",
			"date": "10:30 pm",

        ]
    }
}