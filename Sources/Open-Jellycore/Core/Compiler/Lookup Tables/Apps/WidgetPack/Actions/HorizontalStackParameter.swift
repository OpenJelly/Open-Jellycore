//
//  HorizontalStackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct HorizontalStackParameter: ParameterProtocol, Codable {
	var alignment: Jelly_VerticalAlignment?
	var spacing: JellyDouble?
	var content: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = HorizontalStackParameter()

        if let value = call.first(where: { node in return node.slotName == "alignment" }) {
            parameters.alignment = Jelly_VerticalAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "horizontalStack", name: "alignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "spacing" }) {
            parameters.spacing = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "horizontalStack", name: "spacing"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "content" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.content = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "horizontalStack", name: "content"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"alignment": "VerticalAlignment(identifier: \"VerticalAlign\", displayString: \"Vertical Align\")",
			"spacing": "10",
			"content": "My Views",

        ]
    }
}
