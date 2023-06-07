//
//  SetFileCreationModificationDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetFileCreationModificationDateParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var type: Jelly_SetFileDateType?
	var date: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetFileCreationModificationDateParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setFileCreationModificationDate", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_SetFileDateType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setFileCreationModificationDate", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setFileCreationModificationDate", name: "date"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "[ShortcutInput]",
			"type": "creationDate",
			"date": "January 1st 1997",

        ]
    }
}