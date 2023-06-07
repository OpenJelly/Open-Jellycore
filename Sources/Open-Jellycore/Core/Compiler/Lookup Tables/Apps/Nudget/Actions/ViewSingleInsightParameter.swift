//
//  ViewSingleInsightParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ViewSingleInsightParameter: ParameterProtocol, Codable {
	var insight: Jelly_Insight?
	var segment: Jelly_WidgetSegment?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ViewSingleInsightParameter()

        if let value = call.first(where: { node in return node.slotName == "insight" }) {
            parameters.insight = Jelly_Insight(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewSingleInsight", name: "insight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "segment" }) {
            parameters.segment = Jelly_WidgetSegment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewSingleInsight", name: "segment"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"insight": "NudgetInsight(identifier: \"42-867-5309\", \"Total Spending\")",
			"segment": "week",

        ]
    }
}
