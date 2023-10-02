//
//  DecreaseNumberTrackerParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DecreaseNumberTrackerParameter: ParameterProtocol, Codable {
	var tracker: Jelly_Tracker?
	var amount: JellyDouble?
	var note: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DecreaseNumberTrackerParameter()

        if let value = call.first(where: { node in return node.slotName == "tracker" }) {
            parameters.tracker = Jelly_Tracker(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "decreaseNumberTracker", name: "tracker"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "amount" }) {
            parameters.amount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "decreaseNumberTracker", name: "amount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "note" }) {
            parameters.note = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "decreaseNumberTracker", name: "note"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"tracker": "Tracker(identifier: \"abcde-f\", displayString: \"Hello World\")",
			"amount": "42",
			"note": "This is a cool tracker!",

        ]
    }
}
