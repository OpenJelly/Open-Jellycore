//
//  DateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DateParameter: ParameterProtocol, Codable {
	var WFDateActionDate: JellyDate?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DateParameter()

        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.WFDateActionDate = JellyDate(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "date", name: "date"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "25 December 2021",

        ]
    }
}