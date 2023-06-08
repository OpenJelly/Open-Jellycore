//
//  GetDetailFromTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetDetailFromTextParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var detailType: Jelly_TextDetailType?
	var includeOriginal: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetDetailFromTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getDetailFromText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "detailType" }) {
            parameters.detailType = Jelly_TextDetailType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getDetailFromText", name: "detailType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeOriginal" }) {
            parameters.includeOriginal = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getDetailFromText", name: "includeOriginal"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "\"${ShortcutInput}\"",
			"detailType": "language",
			"includeOriginal": "true",

        ]
    }
}