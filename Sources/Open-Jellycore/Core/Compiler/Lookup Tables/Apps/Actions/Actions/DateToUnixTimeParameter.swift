//
//  DateToUnixTimeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DateToUnixTimeParameter: ParameterProtocol, Codable {
	var date: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DateToUnixTimeParameter()

        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "dateToUnixTime", name: "date"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "January 1st 1997",

        ]
    }
}