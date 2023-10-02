//
//  DownloadURLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DownloadURLParameter: ParameterProtocol, Codable {
	var WFURL: JellyString?
	var method: Jelly_WFHTTPMethod?
	var WFHTTPHeaders: JellyDictionary?
	var requestType: Jelly_WFHTTPBodyType?
	var WFJSONValues: JellyDictionary?
	var WFRequestVariable: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DownloadURLParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "method" }) {
            parameters.method = Jelly_WFHTTPMethod(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "method"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "headers" }) {
            parameters.WFHTTPHeaders = JellyDictionary(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "headers"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "requestType" }) {
            parameters.requestType = Jelly_WFHTTPBodyType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "requestType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "requestJSON" }) {
            parameters.WFJSONValues = JellyDictionary(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "requestJSON"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "requestVar" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFRequestVariable = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "requestVar"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "https://jellycuts.com",
			"method": "POST",
			"headers": "{}",
			"requestType": "Json",
			"requestJSON": "{\"name\": \"Zach\"}",
			"requestVar": "",

        ]
    }
}
