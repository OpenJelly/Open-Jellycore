//
//  RenameFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RenameFileParameter: ParameterProtocol, Codable {
	var WFFile: JellyVariableReference?
	var WFNewFilename: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RenameFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFFile = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "renameFile", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFNewFilename = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "renameFile", name: "name"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",
			"name": "Super Cool File Names",

        ]
    }
}
