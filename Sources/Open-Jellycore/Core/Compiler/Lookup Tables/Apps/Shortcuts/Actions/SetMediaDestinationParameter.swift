//
//  SetMediaDestinationParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetMediaDestinationParameter: ParameterProtocol, Codable {
	var WFMediaRoute: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetMediaDestinationParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "device" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFMediaRoute = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setMediaDestination", name: "device"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"device": "Homepod",

        ]
    }
}