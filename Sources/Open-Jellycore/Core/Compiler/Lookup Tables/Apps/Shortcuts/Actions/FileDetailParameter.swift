//
//  FileDetailParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FileDetailParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var property: Jelly_WFContentItemPropertyName?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FileDetailParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "fileDetail", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "property" }) {
            parameters.property = Jelly_WFContentItemPropertyName(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "fileDetail", name: "property"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"property": "File Extension",

        ]
    }
}
