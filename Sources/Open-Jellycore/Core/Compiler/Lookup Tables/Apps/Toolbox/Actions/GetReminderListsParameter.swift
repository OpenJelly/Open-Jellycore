//
//  GetReminderListsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetReminderListsParameter: ParameterProtocol, Codable {
	var getType: Jelly_ReminderListType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetReminderListsParameter()

        if let value = call.first(where: { node in return node.slotName == "getType" }) {
            parameters.getType = Jelly_ReminderListType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getReminderLists", name: "getType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"getType": "ListNames",

        ]
    }
}
