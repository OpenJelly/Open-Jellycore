//
//  SkipBackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SkipBackParameter: ParameterProtocol, Codable {
	var point: Jelly_WFSkipBackBehavior?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SkipBackParameter()

        if let value = call.first(where: { node in return node.slotName == "point" }) {
            parameters.point = Jelly_WFSkipBackBehavior(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "skipBack", name: "point"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"point": "Beginning",

        ]
    }
}