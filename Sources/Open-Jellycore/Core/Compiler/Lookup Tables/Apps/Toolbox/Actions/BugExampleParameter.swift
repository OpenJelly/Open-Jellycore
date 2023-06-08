//
//  BugExampleParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct BugExampleParameter: ParameterProtocol, Codable {
	var outputCount: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = BugExampleParameter()

        if let value = call.first(where: { node in return node.slotName == "outputCount" }) {
            parameters.outputCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "bugExample", name: "outputCount"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"outputCount": "140",

        ]
    }
}