//
//  AddContactGroupParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddContactGroupParameter: ParameterProtocol, Codable {
	var groupMode: Jelly_ContactGroupMode?
	var name: JellyString?
	var groupName: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddContactGroupParameter()

        if let value = call.first(where: { node in return node.slotName == "groupMode" }) {
            parameters.groupMode = Jelly_ContactGroupMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContactGroup", name: "groupMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContactGroup", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "groupName" }) {
            parameters.groupName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContactGroup", name: "groupName"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"groupMode": "Add",
			"name": "Family",
			"groupName": "Family",

        ]
    }
}