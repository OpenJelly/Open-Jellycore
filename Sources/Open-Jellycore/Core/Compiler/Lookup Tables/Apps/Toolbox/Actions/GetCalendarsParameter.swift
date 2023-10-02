//
//  GetCalendarsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetCalendarsParameter: ParameterProtocol, Codable {
	var getType: Jelly_GetCalendarType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetCalendarsParameter()

        if let value = call.first(where: { node in return node.slotName == "getType" }) {
            parameters.getType = Jelly_GetCalendarType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getCalendars", name: "getType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"getType": "List",

        ]
    }
}
