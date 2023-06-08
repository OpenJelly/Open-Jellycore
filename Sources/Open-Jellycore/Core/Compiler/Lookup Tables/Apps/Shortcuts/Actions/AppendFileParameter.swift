//
//  AppendFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AppendFileParameter: ParameterProtocol, Codable {
	var Value: JellyString?
	var WFFilePath: JellyString?
	var WFAppendOnNewLine: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AppendFileParameter()

        if let value = call.first(where: { node in return node.slotName == "input" }) {
            parameters.Value = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "appendFile", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.WFFilePath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "appendFile", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "newLine" }) {
            parameters.WFAppendOnNewLine = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "appendFile", name: "newLine"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "This is a new line ${Clipboard}",
			"path": "JellycutsHelper/Text.txt",
			"newLine": "true",

        ]
    }
}