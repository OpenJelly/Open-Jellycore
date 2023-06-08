//
//  GetDraftByUUIDParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetDraftByUUIDParameter: ParameterProtocol, Codable {
	var uuid: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetDraftByUUIDParameter()

        if let value = call.first(where: { node in return node.slotName == "uuid" }) {
            parameters.uuid = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getDraftByUUID", name: "uuid"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"uuid": "\"F5BD82B1BA4\"",

        ]
    }
}