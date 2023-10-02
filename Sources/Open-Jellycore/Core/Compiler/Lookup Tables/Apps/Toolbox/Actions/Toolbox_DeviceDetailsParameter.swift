//
//  Toolbox_DeviceDetailsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Toolbox_DeviceDetailsParameter: ParameterProtocol, Codable {
	var deviceDetails: Jelly_DeviceInfoTypes?
	var uptimeOutputTypes: Jelly_UptimeOutputTypes?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Toolbox_DeviceDetailsParameter()

        if let value = call.first(where: { node in return node.slotName == "deviceDetails" }) {
            parameters.deviceDetails = Jelly_DeviceInfoTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deviceDetails", name: "deviceDetails"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "uptimeOutputTypes" }) {
            parameters.uptimeOutputTypes = Jelly_UptimeOutputTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deviceDetails", name: "uptimeOutputTypes"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"deviceDetails": "model",
			"uptimeOutputTypes": "seconds",

        ]
    }
}
