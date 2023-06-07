//
//  GetBatteryStateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetBatteryStateParameter: ParameterProtocol, Codable {
	var state: Jelly_BatteryStateType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetBatteryStateParameter()

        if let value = call.first(where: { node in return node.slotName == "state" }) {
            parameters.state = Jelly_BatteryStateType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getBatteryState", name: "state"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"state": "unplugged",

        ]
    }
}