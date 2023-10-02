//
//  AverageColourParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AverageColourParameter: ParameterProtocol, Codable {
	var inputImage: JellyVariableReference?
	var colourType: Jelly_ColourTypes?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AverageColourParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "inputImage" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.inputImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "averageColour", name: "inputImage"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "colourType" }) {
            parameters.colourType = Jelly_ColourTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "averageColour", name: "colourType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"inputImage": "ShortcutInput",
			"colourType": "the average colour",

        ]
    }
}
