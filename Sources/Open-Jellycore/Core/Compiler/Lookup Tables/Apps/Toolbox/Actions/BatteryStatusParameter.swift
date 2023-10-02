//
//  BatteryStatusParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct BatteryStatusParameter: ParameterProtocol, Codable {
	var batteryState: Jelly_BatteryStates?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = BatteryStatusParameter()

        if let value = call.first(where: { node in return node.slotName == "batteryState" }) {
            parameters.batteryState = Jelly_BatteryStates(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "batteryStatus", name: "batteryState"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"batteryState": "isCharging",

        ]
    }
}
