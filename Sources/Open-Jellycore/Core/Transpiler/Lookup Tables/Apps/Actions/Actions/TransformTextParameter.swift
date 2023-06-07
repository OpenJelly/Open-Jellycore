//
//  TransformTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TransformTextParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var transformation: Jelly_Transformation?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TransformTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "transformText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "transformation" }) {
            parameters.transformation = Jelly_Transformation(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "transformText", name: "transformation"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "hello world!",
			"transformation": "camelCase",

        ]
    }
}