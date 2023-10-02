//
//  TrimFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TrimFileParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var characterClass: Jelly_TrimFileCharacterClass?
	var lineCount: JellyInteger?
	var position: Jelly_TrimFilePosition?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TrimFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "trimFile", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "characterClass" }) {
            parameters.characterClass = Jelly_TrimFileCharacterClass(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "trimFile", name: "characterClass"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "lineCount" }) {
            parameters.lineCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "trimFile", name: "lineCount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "position" }) {
            parameters.position = Jelly_TrimFilePosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "trimFile", name: "position"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "ShortcutInput",
			"characterClass": "lines",
			"lineCount": "2",
			"position": "end",

        ]
    }
}
