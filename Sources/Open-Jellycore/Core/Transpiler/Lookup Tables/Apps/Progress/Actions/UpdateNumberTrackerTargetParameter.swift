//
//  UpdateNumberTrackerTargetParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UpdateNumberTrackerTargetParameter: ParameterProtocol, Codable {
	var tracker: Jelly_Tracker?
	var targetValue: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UpdateNumberTrackerTargetParameter()

        if let value = call.first(where: { node in return node.slotName == "tracker" }) {
            parameters.tracker = Jelly_Tracker(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateNumberTrackerTarget", name: "tracker"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "targetValue" }) {
            parameters.targetValue = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateNumberTrackerTarget", name: "targetValue"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"tracker": "Tracker(identifier: \"abcde-f\", displayString: \"Hello World\")",
			"targetValue": "42",

        ]
    }
}
