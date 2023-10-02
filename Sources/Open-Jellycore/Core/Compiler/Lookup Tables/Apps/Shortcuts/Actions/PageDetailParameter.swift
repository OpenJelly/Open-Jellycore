//
//  PageDetailParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PageDetailParameter: ParameterProtocol, Codable {
	var detail: Jelly_WFContentItemPropertyName?
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PageDetailParameter()

        if let value = call.first(where: { node in return node.slotName == "detail" }) {
            parameters.detail = Jelly_WFContentItemPropertyName(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "pageDetail", name: "detail"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "webpage" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "pageDetail", name: "webpage"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"detail": "pageDetail",
			"webpage": "Page Contents",

        ]
    }
}
