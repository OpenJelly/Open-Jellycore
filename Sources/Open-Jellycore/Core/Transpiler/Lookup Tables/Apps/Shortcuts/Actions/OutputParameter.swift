//
//  OutputParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OutputParameter: ParameterProtocol, Codable {
	var WFOutput: JellyString?
	var noResultBehavior: Jelly_WFNoOutputSurfaceBehavior?
	var WFResponse: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OutputParameter()

        if let value = call.first(where: { node in return node.slotName == "result" }) {
            parameters.WFOutput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "output", name: "result"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "noResultBehavior" }) {
            parameters.noResultBehavior = Jelly_WFNoOutputSurfaceBehavior(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "output", name: "noResultBehavior"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "response" }) {
            parameters.WFResponse = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "output", name: "response"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"result": "ShortcutInput",
			"noResultBehavior": "Respond",
			"response": "No Shortcut Input",

        ]
    }
}