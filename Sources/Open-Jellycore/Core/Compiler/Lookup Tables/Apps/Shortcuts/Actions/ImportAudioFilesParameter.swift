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

        if let variableCall = call.first(where: { node in return node.slotName == "files" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "importAudioFiles", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "encode" }) {
            parameters.WFImportAudioFilesReencode = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "importAudioFiles", name: "encode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "enoder" }) {
            parameters.enoder = Jelly_WFImportAudioFilesEncoder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "importAudioFiles", name: "enoder"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "ShortcutInput",
			"encode": "true",
			"enoder": "Default",

        ]
    }
}
