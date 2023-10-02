//
//  ViewBudgetLeftParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ViewBudgetLeftParameter: ParameterProtocol, Codable {
	var segment: Jelly_WidgetSegment?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ViewBudgetLeftParameter()

        if let value = call.first(where: { node in return node.slotName == "segment" }) {
            parameters.segment = Jelly_WidgetSegment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "viewBudgetLeft", name: "segment"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"segment": "week",

        ]
    }
}
