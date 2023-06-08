//
//  CreatePDFParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreatePDFParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFPDFIncludeMargin: JellyBoolean?
	var pages: Jelly_WFPDFIncludedPages?
	var WFPDFSinglePage: JellyString?
	var WFPDFPageRangeStart: JellyString?
	var WFPDFPageRangeEnd: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreatePDFParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPDF", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "margins" }) {
            parameters.WFPDFIncludeMargin = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPDF", name: "margins"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pages" }) {
            parameters.pages = Jelly_WFPDFIncludedPages(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPDF", name: "pages"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "singlePageNumb" }) {
            parameters.WFPDFSinglePage = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPDF", name: "singlePageNumb"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pageStart" }) {
            parameters.WFPDFPageRangeStart = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPDF", name: "pageStart"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pageEnd" }) {
            parameters.WFPDFPageRangeEnd = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createPDF", name: "pageEnd"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "images",
			"margins": "true",
			"pages": "All Pages",

        ]
    }
}