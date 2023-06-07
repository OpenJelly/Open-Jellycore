//
//  QueryDocumentParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QueryDocumentParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var queryType: Jelly_DocumentQueryType?
	var cssQuery: JellyString?
	var xpathQuery: JellyString?
	var outputType: Jelly_QueryDocumentOutput?
	var oneResult: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QueryDocumentParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryDocument", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "queryType" }) {
            parameters.queryType = Jelly_DocumentQueryType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryDocument", name: "queryType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "cssQuery" }) {
            parameters.cssQuery = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryDocument", name: "cssQuery"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "xpathQuery" }) {
            parameters.xpathQuery = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryDocument", name: "xpathQuery"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "outputType" }) {
            parameters.outputType = Jelly_QueryDocumentOutput(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryDocument", name: "outputType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "oneResult" }) {
            parameters.oneResult = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryDocument", name: "oneResult"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",
			"queryType": "css",
			"cssQuery": "head > title",
			"xpathQuery": "//head/title",
			"outputType": "text",
			"oneResult": "false",

        ]
    }
}