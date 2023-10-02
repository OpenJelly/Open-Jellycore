//
//  LogWorkoutParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct LogWorkoutParameter: ParameterProtocol, Codable {
	var type: Jelly_WFWorkoutReadableActivityType?
	var WFWorkoutDate: JellyDate?
	var WFWorkoutDuration: ShortcutsQuantity?
	var WFWorkoutCaloriesQuantity: ShortcutsQuantity?
	var WFWorkoutDistanceQuantity: ShortcutsQuantity?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = LogWorkoutParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFWorkoutReadableActivityType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "logWorkout", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.WFWorkoutDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "logWorkout", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "duration" }) {
            parameters.WFWorkoutDuration = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "logWorkout", name: "duration"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "calories" }) {
            parameters.WFWorkoutCaloriesQuantity = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "logWorkout", name: "calories"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "distance" }) {
            parameters.WFWorkoutDistanceQuantity = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "logWorkout", name: "distance"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "Cycling",
			"date": "December 1st 2020",
			"duration": "10 Minutes",
			"calories": "214 cal",
			"distance": "1 mi",

        ]
    }
}
