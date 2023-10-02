//
//  ZStackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ZStackParameter: ParameterProtocol, Codable {
	var alignment: Jelly_Alignment?
	var content: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ZStackParameter()

        if let value = call.first(where: { node in return node.slotName == "alignment" }) {
            parameters.alignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "zStack", name: "alignment"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "content" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.content = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "zStack", name: "content"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"alignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"content": "My Views",

        ]
    }
}
