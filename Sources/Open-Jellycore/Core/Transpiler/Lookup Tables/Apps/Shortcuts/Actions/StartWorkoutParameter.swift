//
//  StartWorkoutParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct StartWorkoutParameter: ParameterProtocol, Codable {
	var Identifier: Jelly_WorkoutIdentifiers?
	var isOpenEnded: JellyIntegerBoolean?
	var Magnitude: JellyString?
	var Unit: ShortcutsQuantity?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = StartWorkoutParameter()

        if let value = call.first(where: { node in return node.slotName == "workout" }) {
            parameters.Identifier = Jelly_WorkoutIdentifiers(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "startWorkout", name: "workout"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "open" }) {
            parameters.isOpenEnded = JellyIntegerBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "startWorkout", name: "open"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.Magnitude = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "startWorkout", name: "value"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "unit" }) {
            parameters.Unit = ShortcutsQuantity(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "startWorkout", name: "unit"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"workout": "\"Outdoor Walk\"",
			"open": "false",
			"value": "200",
			"unit": "cal",

        ]
    }
}
