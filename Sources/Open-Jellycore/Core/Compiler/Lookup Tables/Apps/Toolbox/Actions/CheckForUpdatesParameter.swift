//
//  CheckForUpdatesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CheckForUpdatesParameter: ParameterProtocol, Codable {
	var routineHubID: JellyInteger?
	var currentVersion: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CheckForUpdatesParameter()

        if let value = call.first(where: { node in return node.slotName == "routineHubID" }) {
            parameters.routineHubID = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkForUpdates", name: "routineHubID"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "currentVersion" }) {
            parameters.currentVersion = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkForUpdates", name: "currentVersion"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"routineHubID": "6231",
			"currentVersion": "1.0",

        ]
    }
}
