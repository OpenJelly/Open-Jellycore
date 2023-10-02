//
//  ExtractTextFromImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ExtractTextFromImageParameter: ParameterProtocol, Codable {
	var WFImage: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ExtractTextFromImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFImage = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "extractTextFromImage", name: "image"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "Clipboard",

        ]
    }
}
