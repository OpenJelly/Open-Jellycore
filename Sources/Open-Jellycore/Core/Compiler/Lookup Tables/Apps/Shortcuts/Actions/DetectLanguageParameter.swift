//
//  DetectLanguageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DetectLanguageParameter: ParameterProtocol, Codable {
	var WFInput: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DetectLanguageParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFInput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "detectLanguage", name: "text"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hallo Ich Bin Zachary",

        ]
    }
}