//
//  AddWalletPassParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddWalletPassParameter: ParameterProtocol, Codable {
	var passes: JellyVariableReference?
	var preview: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddWalletPassParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "passes" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.passes = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addWalletPass", name: "passes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "preview" }) {
            parameters.preview = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addWalletPass", name: "preview"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"passes": "ShortcutInput",
			"preview": "true",

        ]
    }
}
