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
            ErrorReporter.shared.reportError(error: .missingParameter(function: "setBluetooth", name: "value"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"value": "true",

        ]
    }
}