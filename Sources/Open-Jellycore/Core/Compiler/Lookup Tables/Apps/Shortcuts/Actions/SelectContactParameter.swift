//
//  SelectContactParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SelectContactParameter: ParameterProtocol, Codable {
	var WFSelectMultiple: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SelectContactParameter()

        if let value = call.first(where: { node in return node.slotName == "multiple" }) {
            parameters.WFSelectMultiple = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "selectContact", name: "multiple"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"multiple": "true",

        ]
    }
}
