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
            ErrorReporter.shared.reportError(error: .missingParameter(function: "selectContact", name: "multiple"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"multiple": "true",

        ]
    }
}