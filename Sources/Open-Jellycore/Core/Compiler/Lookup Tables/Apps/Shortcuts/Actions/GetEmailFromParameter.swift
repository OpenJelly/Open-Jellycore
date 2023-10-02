//
//  GetEmailFromParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetEmailFromParameter: ParameterProtocol, Codable {
	var WFInput: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetEmailFromParameter()

        if let value = call.first(where: { node in return node.slotName == "input" }) {
            parameters.WFInput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getEmailFrom", name: "input"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "Contact jellycuts@gmail.com",

        ]
    }
}
