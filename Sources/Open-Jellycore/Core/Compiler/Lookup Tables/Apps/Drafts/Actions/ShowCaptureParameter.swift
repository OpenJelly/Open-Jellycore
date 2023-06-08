//
//  ShowCaptureParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShowCaptureParameter: ParameterProtocol, Codable {
	var content: JellyString?
	var tags: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShowCaptureParameter()

        if let value = call.first(where: { node in return node.slotName == "content" }) {
            parameters.content = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "showCapture", name: "content"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tags" }) {
            parameters.tags = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "showCapture", name: "tags"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"content": "\"Hello World on ${CurrentDate}\"",
			"tags": "[]",

        ]
    }
}