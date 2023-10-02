//
//  FormatDateExtendedParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatDateExtendedParameter: ParameterProtocol, Codable {
	var sourceDate: JellyDate?
	var dateTimeZone: Jelly_DateOrTime?
	var dateFormat: Jelly_DateFormat?
	var timeFormat: Jelly_TimeFormat?
	var zoneFormat: Jelly_ZoneFormat?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatDateExtendedParameter()

        if let value = call.first(where: { node in return node.slotName == "sourceDate" }) {
            parameters.sourceDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatDateExtended", name: "sourceDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dateTimeZone" }) {
            parameters.dateTimeZone = Jelly_DateOrTime(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatDateExtended", name: "dateTimeZone"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dateFormat" }) {
            parameters.dateFormat = Jelly_DateFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatDateExtended", name: "dateFormat"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "timeFormat" }) {
            parameters.timeFormat = Jelly_TimeFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatDateExtended", name: "timeFormat"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "zoneFormat" }) {
            parameters.zoneFormat = Jelly_ZoneFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formatDateExtended", name: "zoneFormat"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"sourceDate": "February 26th 2022",
			"dateTimeZone": "DateFormat",
			"dateFormat": "weekdayFull",
			"timeFormat": "ampm",
			"zoneFormat": "timeZoneShort",

        ]
    }
}
