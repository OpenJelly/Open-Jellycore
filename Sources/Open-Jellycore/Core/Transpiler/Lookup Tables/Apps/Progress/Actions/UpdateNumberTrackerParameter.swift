//
//  UpdateNumberTrackerParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UpdateNumberTrackerParameter: ParameterProtocol, Codable {
	var tracker: Jelly_Tracker?
	var value: JellyDouble?
	var note: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UpdateNumberTrackerParameter()

        if let value = call.first(where: { node in return node.slotName == "tracker" }) {
            parameters.tracker = Jelly_Tracker(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateNumberTracker", name: "tracker"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.value = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateNumberTracker", name: "value"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "note" }) {
            parameters.note = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateNumberTracker", name: "note"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"tracker": "Tracker(identifier: \"abcde-f\", displayString: \"Hello World\")",
			"value": "42.5",
			"note": "\"This is some awesome progress!\"",

        ]
    }
}
