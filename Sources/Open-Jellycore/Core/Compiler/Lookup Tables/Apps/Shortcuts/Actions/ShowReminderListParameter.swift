//
//  ShowReminderListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShowReminderListParameter: ParameterProtocol, Codable {
	var WFList: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShowReminderListParameter()

        if let value = call.first(where: { node in return node.slotName == "list" }) {
            parameters.WFList = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "showReminderList", name: "list"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"list": "r-School",

        ]
    }
}