//
//  ShowInStoreParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShowInStoreParameter: ParameterProtocol, Codable {
	var WFProduct: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShowInStoreParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "product" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFProduct = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "showInStore", name: "product"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"product": "Searched App",

        ]
    }
}
