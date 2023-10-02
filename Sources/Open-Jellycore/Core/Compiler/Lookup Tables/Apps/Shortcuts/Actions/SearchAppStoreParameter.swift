//
//  SearchAppStoreParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SearchAppStoreParameter: ParameterProtocol, Codable {
	var WFSearchTerm: JellyString?
	var by: Jelly_WFAttribute?
	var region: Jelly_WFCountry?
	var device: Jelly_WFEntity?
	var WFItemLimit: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SearchAppStoreParameter()

        if let value = call.first(where: { node in return node.slotName == "input" }) {
            parameters.WFSearchTerm = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "searchAppStore", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "by" }) {
            parameters.by = Jelly_WFAttribute(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "searchAppStore", name: "by"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "region" }) {
            parameters.region = Jelly_WFCountry(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "searchAppStore", name: "region"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "device" }) {
            parameters.device = Jelly_WFEntity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "searchAppStore", name: "device"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.WFItemLimit = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "searchAppStore", name: "limit"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "Jellycuts",
			"by": "All",
			"region": "United States",
			"device": "iPhone",
			"limit": "1",

        ]
    }
}
