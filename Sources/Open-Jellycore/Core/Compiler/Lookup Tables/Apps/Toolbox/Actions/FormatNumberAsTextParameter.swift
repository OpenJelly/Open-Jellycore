//
//  FormatNumberAsTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatNumberAsTextParameter: ParameterProtocol, Codable {
	var number: JellyInteger?
	var locale: JellyString?
	var typeCase: Jelly_PluraliseCase?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatNumberAsTextParameter()

        if let value = call.first(where: { node in return node.slotName == "number" }) {
            parameters.number = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatNumberAsText", name: "number"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "locale" }) {
            parameters.locale = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatNumberAsText", name: "locale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "typeCase" }) {
            parameters.typeCase = Jelly_PluraliseCase(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatNumberAsText", name: "typeCase"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"number": "124937031",
			"locale": "\"en-US\"",
			"typeCase": "sentence",

        ]
    }
}