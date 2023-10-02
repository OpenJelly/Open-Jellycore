//
//  GetFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFileParameter: ParameterProtocol, Codable {
	var WFShowFilePicker: JellyBoolean?
	var WFGetFilePath: JellyString?
	var WFFileErrorIfNotFound: JellyBoolean?
	var SelectMultiple: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFileParameter()

        if let value = call.first(where: { node in return node.slotName == "picker" }) {
            parameters.WFShowFilePicker = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFile", name: "picker"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.WFGetFilePath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFile", name: "path"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "error" }) {
            parameters.WFFileErrorIfNotFound = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFile", name: "error"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "multiple" }) {
            parameters.SelectMultiple = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFile", name: "multiple"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"picker": "false",
			"path": "JellycutsHelper/meta.json",
			"error": "false",
			"multiple": "false",

        ]
    }
}
