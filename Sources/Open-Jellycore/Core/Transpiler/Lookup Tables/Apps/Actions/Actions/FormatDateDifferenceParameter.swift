//
//  FormatDateDifferenceParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatDateDifferenceParameter: ParameterProtocol, Codable {
	var firstDate: JellyString?
	var secondDate: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatDateDifferenceParameter()

        if let value = call.first(where: { node in return node.slotName == "firstDate" }) {
            parameters.firstDate = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDateDifference", name: "firstDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "secondDate" }) {
            parameters.secondDate = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDateDifference", name: "secondDate"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"firstDate": "January 1st 1997",
			"secondDate": "\"${CurrentDate}\"",

        ]
    }
}