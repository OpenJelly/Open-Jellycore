//
//  FacetimeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FacetimeParameter: ParameterProtocol, Codable {
	var type: Jelly_WFFaceTimeType?
	var WFFaceTimeContact: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FacetimeParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFFaceTimeType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "facetime", name: "type"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "contact" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFFaceTimeContact = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "facetime", name: "contact"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "Video",
			"contact": "Contact",

        ]
    }
}
