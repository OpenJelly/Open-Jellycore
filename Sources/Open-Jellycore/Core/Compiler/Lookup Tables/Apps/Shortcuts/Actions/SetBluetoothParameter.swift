//
//  SetBluetoothParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetBluetoothParameter: ParameterProtocol, Codable {
	var value: JellyIntegerBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetBluetoothParameter()

        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.value = JellyIntegerBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setBluetooth", name: "value"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"value": "true",

        ]
    }
}
