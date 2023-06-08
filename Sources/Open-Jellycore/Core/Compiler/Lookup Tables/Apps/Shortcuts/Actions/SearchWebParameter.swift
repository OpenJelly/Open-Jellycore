//
//  SearchWebParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SearchWebParameter: ParameterProtocol, Codable {
	var WFInputText: JellyString?
	var destination: Jelly_WFSearchWebDestination?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SearchWebParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFInputText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchWeb", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "destination" }) {
            parameters.destination = Jelly_WFSearchWebDestination(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "searchWeb", name: "destination"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Jellycuts",
			"destination": "Google",

        ]
    }
}