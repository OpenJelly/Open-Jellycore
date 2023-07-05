//
//  GetMenuItemParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetMenuItemParameter: ParameterProtocol, Codable {
	var menuItem: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetMenuItemParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "menuItem" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.menuItem = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getMenuItem", name: "menuItem"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"menuItem": "ShortcutInput",

        ]
    }
}