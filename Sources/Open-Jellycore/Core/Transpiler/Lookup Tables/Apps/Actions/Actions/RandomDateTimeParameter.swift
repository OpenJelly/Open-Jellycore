//
//  RandomDateTimeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RandomDateTimeParameter: ParameterProtocol, Codable {
	var start: JellyString?
	var end: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RandomDateTimeParameter()

        if let value = call.first(where: { node in return node.slotName == "start" }) {
            parameters.start = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomDateTime", name: "start"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "end" }) {
            parameters.end = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomDateTime", name: "end"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"start": "January 1st 1997",
			"end": "${CurrentDate}",

        ]
    }
}