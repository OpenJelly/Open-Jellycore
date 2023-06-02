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
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "method" }) {
            parameters.method = Jelly_WFHTTPMethod(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "method"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "headers" }) {
            parameters.WFHTTPHeaders = JellyDictionary(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "headers"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "requestType" }) {
            parameters.requestType = Jelly_WFHTTPBodyType(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "requestType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "requestJSON" }) {
            parameters.WFJSONValues = JellyDictionary(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "requestJSON"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "requestVar" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFRequestVariable = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "downloadURL", name: "requestVar"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
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