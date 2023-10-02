//
//  FlipImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FlipImageParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var mode: Jelly_WFImageFlipDirection?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FlipImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "flipImage", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_WFImageFlipDirection(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "flipImage", name: "mode"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "Clipboard",
			"mode": "Horizontal",

        ]
    }
}
