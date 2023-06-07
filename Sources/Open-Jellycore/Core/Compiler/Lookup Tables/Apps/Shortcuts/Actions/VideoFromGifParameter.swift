//
//  VideoFromGifParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct VideoFromGifParameter: ParameterProtocol, Codable {
	var WFInputGIF: JellyVariableReference?
	var WFMakeVideoFromGIFActionLoopCount: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = VideoFromGifParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "gif" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInputGIF = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "videoFromGif", name: "gif"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "loop" }) {
            parameters.WFMakeVideoFromGIFActionLoopCount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "videoFromGif", name: "loop"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"gif": "newGIF",
			"loop": "1",

        ]
    }
}