//
//  SetOrientationLockParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetOrientationLockParameter: ParameterProtocol, Codable {
	var OnValue: JellyIntegerBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetOrientationLockParameter()

        if let value = call.first(where: { node in return node.slotName == "state" }) {
            parameters.OnValue = JellyIntegerBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setOrientationLock", name: "state"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"state": "true",

        ]
    }
}