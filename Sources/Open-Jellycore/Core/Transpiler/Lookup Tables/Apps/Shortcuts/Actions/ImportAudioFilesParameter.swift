//
//  ImportAudioFilesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ImportAudioFilesParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFImportAudioFilesReencode: JellyBoolean?
	var enoder: Jelly_WFImportAudioFilesEncoder?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ImportAudioFilesParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "files" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "importAudioFiles", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "encode" }) {
            parameters.WFImportAudioFilesReencode = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "importAudioFiles", name: "encode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "enoder" }) {
            parameters.enoder = Jelly_WFImportAudioFilesEncoder(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "importAudioFiles", name: "enoder"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "ShortcutInput",
			"encode": "true",
			"enoder": "Default",

        ]
    }
}