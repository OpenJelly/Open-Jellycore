//
//  CheckGVParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CheckGVParameter: ParameterProtocol, Codable {
	var name: JellyString?
	var create: JellyBoolean?
	var value: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CheckGVParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkGV", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "create" }) {
            parameters.create = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkGV", name: "create"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.value = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkGV", name: "value"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "\"Last updated date\"",
			"create": "true",
			"value": "\"${CurrentDate}\"",

        ]
    }
}
