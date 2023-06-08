//
//  GetRelativeDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetRelativeDateParameter: ParameterProtocol, Codable {
	var date: JellyDate?
	var context: Jelly_DateContext?
	var unitsStyle: Jelly_DateUnitsStyle?
	var startingDate: JellyDate?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetRelativeDateParameter()

        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRelativeDate", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "context" }) {
            parameters.context = Jelly_DateContext(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRelativeDate", name: "context"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "unitsStyle" }) {
            parameters.unitsStyle = Jelly_DateUnitsStyle(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRelativeDate", name: "unitsStyle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startingDate" }) {
            parameters.startingDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getRelativeDate", name: "startingDate"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "CurrentDate",
			"context": "StartOfSentence",
			"unitsStyle": "Abbreviated",
			"startingDate": "AdjustedDate",

        ]
    }
}