//
//  SkipStageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SkipStageParameter: ParameterProtocol, Codable {
	var finalStageEndSessionAction: Jelly_SkipEndSession?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SkipStageParameter()

        if let value = call.first(where: { node in return node.slotName == "finalStageEndSessionAction" }) {
            parameters.finalStageEndSessionAction = Jelly_SkipEndSession(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "skipStage", name: "finalStageEndSessionAction"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"finalStageEndSessionAction": "no",

        ]
    }
}