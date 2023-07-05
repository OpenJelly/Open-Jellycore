//
//  GetTextFromPDFParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetTextFromPDFParameter: ParameterProtocol, Codable {
	var textType: Jelly_WFGetTextFromPDFTextType?
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetTextFromPDFParameter()

        if let value = call.first(where: { node in return node.slotName == "textType" }) {
            parameters.textType = Jelly_WFGetTextFromPDFTextType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromPDF", name: "textType"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "pdf" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getTextFromPDF", name: "pdf"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"textType": "Text",
			"pdf": "ShortcutInput",

        ]
    }
}