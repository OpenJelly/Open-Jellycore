//
//  FormatNumberParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatNumberParameter: ParameterProtocol, Codable {
	var WFNumber: JellyDouble?
	var WFNumberFormatDecimalPlaces: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatNumberParameter()

        if let value = call.first(where: { node in return node.slotName == "number" }) {
            parameters.WFNumber = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatNumber", name: "number"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "places" }) {
            parameters.WFNumberFormatDecimalPlaces = JellyDouble(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatNumber", name: "places"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"number": "10023.3323",
			"places": "2",

        ]
    }
}