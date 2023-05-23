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
            parameters.WFTextActionText = JellyString(value)
        } else {
            // TODO: Reimplement error handling
            print("unable to get parameter text")
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
