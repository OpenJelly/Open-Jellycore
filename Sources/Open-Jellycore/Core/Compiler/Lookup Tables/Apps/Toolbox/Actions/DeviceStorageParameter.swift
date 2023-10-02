//
//  DeviceStorageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DeviceStorageParameter: ParameterProtocol, Codable {
	var storageTypes: Jelly_StorageTypes?
	var unitOfMeasurement: Jelly_MbGb?
	var includeUnits: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DeviceStorageParameter()

        if let value = call.first(where: { node in return node.slotName == "storageTypes" }) {
            parameters.storageTypes = Jelly_StorageTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deviceStorage", name: "storageTypes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "unitOfMeasurement" }) {
            parameters.unitOfMeasurement = Jelly_MbGb(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deviceStorage", name: "unitOfMeasurement"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeUnits" }) {
            parameters.includeUnits = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deviceStorage", name: "includeUnits"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"storageTypes": "remainingSpace",
			"unitOfMeasurement": "MB",
			"includeUnits": "true",

        ]
    }
}
