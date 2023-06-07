//
//  TransformTextWithJavaScriptParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TransformTextWithJavaScriptParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var javaScriptCode: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TransformTextWithJavaScriptParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "transformTextWithJavaScript", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "javaScriptCode" }) {
            parameters.javaScriptCode = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "transformTextWithJavaScript", name: "javaScriptCode"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "My really awesome text",
			"javaScriptCode": "return `Appending to my text:` + text",

        ]
    }
}