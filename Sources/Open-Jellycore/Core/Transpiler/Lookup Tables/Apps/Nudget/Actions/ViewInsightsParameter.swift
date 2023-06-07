//
//  ViewInsightsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ViewInsightsParameter: ParameterProtocol, Codable {
	var segment: Jelly_WidgetSegment?
	var insight: JellyArray<Jelly_Insight>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ViewInsightsParameter()

        if let value = call.first(where: { node in return node.slotName == "segment" }) {
            parameters.segment = Jelly_WidgetSegment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewInsights", name: "segment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "insight" }) {
            parameters.insight = JellyArray<Jelly_Insight>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewInsights", name: "insight"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"segment": "week",
			"insight": "NudgetInsight(identifier: \"42-867-5309\", \"Total Spending\")",

        ]
    }
}
