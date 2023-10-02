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
            parameters.WFDateActionDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "date", name: "date"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "25 December 2021",

        ]
    }
}
