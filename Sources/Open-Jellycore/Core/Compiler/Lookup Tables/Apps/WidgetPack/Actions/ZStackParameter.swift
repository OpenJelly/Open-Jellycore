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
            ErrorReporter.shared.reportError(error: .missingParameter(function: "zStack", name: "alignment"), node: nil)
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
            ErrorReporter.shared.reportError(error: .missingParameter(function: "zStack", name: "content"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"alignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"content": "My Views",

        ]
    }
}
