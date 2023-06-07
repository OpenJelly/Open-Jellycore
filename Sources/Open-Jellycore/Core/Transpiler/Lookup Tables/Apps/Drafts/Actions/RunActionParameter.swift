//
//  RunActionParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunActionParameter: ParameterProtocol, Codable {
	var action: Jelly_Action?
	var content: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunActionParameter()

        if let value = call.first(where: { node in return node.slotName == "action" }) {
            parameters.action = Jelly_Action(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runAction", name: "action"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "content" }) {
            parameters.content = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "runAction", name: "content"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"action": "Action(identifier: \"coolID\", displayString: \"My Custom Action\", name: \"My Custom Action\")",
			"content": "\"Some really cool text\"",

        ]
    }
}
