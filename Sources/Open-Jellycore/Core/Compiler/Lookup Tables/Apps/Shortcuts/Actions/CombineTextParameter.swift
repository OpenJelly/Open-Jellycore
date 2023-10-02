//
//  CombineTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CombineTextParameter: ParameterProtocol, Codable {
	var text: JellyArray<JellyVariableReference>?
	var combine: Jelly_WFTextSeparator?
	var WFTextCustomSeparator: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CombineTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "combineText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "combine" }) {
            parameters.combine = Jelly_WFTextSeparator(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "combineText", name: "combine"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "separator" }) {
            parameters.WFTextCustomSeparator = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "combineText", name: "separator"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "Hello World",
			"combine": "Custom",
			"separator": ",",

        ]
    }
}
