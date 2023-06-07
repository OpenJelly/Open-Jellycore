//
//  GetWorkoutsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetWorkoutsParameter: ParameterProtocol, Codable {
	var workoutType: JellyString?
	var useDateRange: JellyBoolean?
	var afterDate: JellyDate?
	var beforeDate: JellyDate?
	var units: Jelly_WorkoutUnits?
	var tempUnits: Jelly_TempUnits?
	var sort: Jelly_WorkoutSort?
	var dateOrder: Jelly_WorkoutTimeOrder?
	var distanceOrder: Jelly_WorkoutDistanceOrder?
	var energyOrder: Jelly_WorkoutEnergyOrder?
	var durationOrder: Jelly_WorkoutDurationOrder?
	var limit: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetWorkoutsParameter()

        if let value = call.first(where: { node in return node.slotName == "workoutType" }) {
            parameters.workoutType = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "workoutType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "useDateRange" }) {
            parameters.useDateRange = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "useDateRange"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "afterDate" }) {
            parameters.afterDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "afterDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "beforeDate" }) {
            parameters.beforeDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "beforeDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "units" }) {
            parameters.units = Jelly_WorkoutUnits(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "units"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tempUnits" }) {
            parameters.tempUnits = Jelly_TempUnits(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "tempUnits"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sort" }) {
            parameters.sort = Jelly_WorkoutSort(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "sort"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dateOrder" }) {
            parameters.dateOrder = Jelly_WorkoutTimeOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "dateOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "distanceOrder" }) {
            parameters.distanceOrder = Jelly_WorkoutDistanceOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "distanceOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "energyOrder" }) {
            parameters.energyOrder = Jelly_WorkoutEnergyOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "energyOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "durationOrder" }) {
            parameters.durationOrder = Jelly_WorkoutDurationOrder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "durationOrder"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "limit" }) {
            parameters.limit = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getWorkouts", name: "limit"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"workoutType": "All",
			"useDateRange": "false",
			"afterDate": "",
			"beforeDate": "",
			"units": "metric",
			"tempUnits": "Farenheit",
			"sort": "StartDate",
			"dateOrder": "OldestFirst",
			"distanceOrder": "FurthestFirst",
			"energyOrder": "MostEnergyFirst",
			"durationOrder": "LongestFirst",
			"limit": "15",

        ]
    }
}