//
//  VerticalStackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct VerticalStackParameter: ParameterProtocol, Codable {
	var alignment: Jelly_HorizontalAlignment?
	var spacing: JellyDouble?
	var content: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = VerticalStackParameter()

        if let value = call.first(where: { node in return node.slotName == "alignment" }) {
            parameters.alignment = Jelly_HorizontalAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "verticalStack", name: "alignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "spacing" }) {
            parameters.spacing = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "verticalStack", name: "spacing"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "content" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.content = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "verticalStack", name: "content"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"alignment": "HorizontalAlignment(identifier: \"HorzontalAlign\", displayString: \"Horizontal Align\")",
			"spacing": "10",
			"content": "My Views",

        ]
    }
}
