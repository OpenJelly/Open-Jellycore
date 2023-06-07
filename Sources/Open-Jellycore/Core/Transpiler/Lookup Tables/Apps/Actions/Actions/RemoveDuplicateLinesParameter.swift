//
//  RemoveDuplicateLinesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveDuplicateLinesParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var caseInsensitive: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveDuplicateLinesParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeDuplicateLines", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "caseInsensitive" }) {
            parameters.caseInsensitive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "removeDuplicateLines", name: "caseInsensitive"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "This is a test\nThis is a test",
			"caseInsensitive": "false",

        ]
    }
}