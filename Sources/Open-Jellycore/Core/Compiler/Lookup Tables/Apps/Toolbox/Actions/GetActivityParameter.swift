//
//  GetActivityParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetActivityParameter: ParameterProtocol, Codable {
	var activityQueryType: Jelly_ActivityQueryType?
	var startDate: JellyDate?
	var endDate: JellyDate?
	var onDay: JellyDate?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetActivityParameter()

        if let value = call.first(where: { node in return node.slotName == "activityQueryType" }) {
            parameters.activityQueryType = Jelly_ActivityQueryType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getActivity", name: "activityQueryType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "startDate" }) {
            parameters.startDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getActivity", name: "startDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "endDate" }) {
            parameters.endDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getActivity", name: "endDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "onDay" }) {
            parameters.onDay = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getActivity", name: "onDay"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getActivity", name: "limit"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"activityQueryType": "BetwweenDates",
			"startDate": "March 21st 2022",
			"endDate": "March 22nd 2022",
			"onDay": "",
			"limit": "15",

        ]
    }
}