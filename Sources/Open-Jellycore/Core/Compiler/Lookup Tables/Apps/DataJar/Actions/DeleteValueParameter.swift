//
//  DeleteValueParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DeleteValueParameter: ParameterProtocol, Codable {
	var keyPath: JellyString?
	var errorWhenValueNotFound: JellyBoolean?
	var deleteStrategy: Jelly_DeleteStrategy?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DeleteValueParameter()

        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deleteValue", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "errorWhenValueNotFound" }) {
            parameters.errorWhenValueNotFound = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deleteValue", name: "errorWhenValueNotFound"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deleteStrategy" }) {
            parameters.deleteStrategy = Jelly_DeleteStrategy(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deleteValue", name: "deleteStrategy"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"keyPath": "count/",
			"errorWhenValueNotFound": "false",
			"deleteStrategy": "alwaysAllow",

        ]
    }
}
