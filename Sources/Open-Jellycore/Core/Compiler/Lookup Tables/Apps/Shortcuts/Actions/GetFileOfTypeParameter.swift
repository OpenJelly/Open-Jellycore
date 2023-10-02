//
//  GetFileOfTypeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFileOfTypeParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFFileType: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFileOfTypeParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFileOfType", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.WFFileType = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFileOfType", name: "type"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"type": "public.rtf",

        ]
    }
}
