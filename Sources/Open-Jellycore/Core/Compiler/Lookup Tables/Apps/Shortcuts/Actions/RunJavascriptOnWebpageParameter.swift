//
//  RunJavascriptOnWebpageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunJavascriptOnWebpageParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFJavaScript: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunJavascriptOnWebpageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "url" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runJavascriptOnWebpage", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "javascript" }) {
            parameters.WFJavaScript = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runJavascriptOnWebpage", name: "javascript"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "ShortcutInput",
			"javascript": "document.body.style.backgroundColor = 'yellow'; completion();",

        ]
    }
}
