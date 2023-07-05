//
//  CallParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CallParameter: ParameterProtocol, Codable {
	var WFCallContact: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CallParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "contact" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFCallContact = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "call", name: "contact"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"contact": "Contact",

        ]
    }
}