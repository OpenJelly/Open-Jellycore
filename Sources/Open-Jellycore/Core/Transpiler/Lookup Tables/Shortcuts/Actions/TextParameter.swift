//
//  TextParameter.swift
//
//
//  Created by Taylor Lineman on 1/2/23.
//

struct TextParameter: ParameterProtocol, Codable {
	var WFTextActionText: JellyString?

    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFTextActionText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            // TODO: Reimplement error handling
            ErrorHandler.shared.reportError(error: .missingParameter(function: "Text", name: "text"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello World",
        ]
    }
}
