//
//  ParseDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ParseDateParameter: ParameterProtocol, Codable {
	var date: JellyArray<JellyVariableReference>?
	var format: JellyString?
	var errorIfInvalid: JellyBoolean?
	var locale: Jelly_DateLocale?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ParseDateParameter()

        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "parseDate", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.format = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "parseDate", name: "format"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "errorIfInvalid" }) {
            parameters.errorIfInvalid = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "parseDate", name: "errorIfInvalid"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "locale" }) {
            parameters.locale = Jelly_DateLocale(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "parseDate", name: "locale"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "January 1st 1997",
			"format": "MM/dd/yyyy",
			"errorIfInvalid": "true",
			"locale": "DateLocale(identifier: \"en\", displayString: \"en\")",

        ]
    }
}
