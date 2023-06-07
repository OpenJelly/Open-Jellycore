//
//  AddContactParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddContactParameter: ParameterProtocol, Codable {
	var lastName: JellyString?
	var firstName: JellyString?
	var jobTitle: JellyString?
	var companyName: JellyString?
	var image: JellyVariableReference?
	var group: JellyArray<JellyVariableReference>?
	var addEmail1: JellyBoolean?
	var email1: JellyString?
	var email1Type: Jelly_EmailType?
	var addEmail2: JellyBoolean?
	var email2: JellyString?
	var email2Type: Jelly_EmailType?
	var addPhone1: JellyBoolean?
	var phone1: JellyString?
	var phone1Type: Jelly_PhoneType?
	var addPhone2: JellyBoolean?
	var phone2: JellyString?
	var phone2Type: Jelly_PhoneType?
	var addAddress1: Jelly_AddAddressType?
	var address1: JellyString?
	var location1: ShortcutsPlacemark?
	var addAddress2: Jelly_AddAddressType?
	var address2: JellyString?
	var location2: ShortcutsPlacemark?
	var url: JellyString?
	var birthday: JellyDate?
	var note: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddContactParameter()

        if let value = call.first(where: { node in return node.slotName == "lastName" }) {
            parameters.lastName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "lastName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "firstName" }) {
            parameters.firstName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "firstName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "jobTitle" }) {
            parameters.jobTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "jobTitle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "companyName" }) {
            parameters.companyName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "companyName"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "group" }) {
            parameters.group = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "group"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addEmail1" }) {
            parameters.addEmail1 = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "addEmail1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "email1" }) {
            parameters.email1 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "email1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "email1Type" }) {
            parameters.email1Type = Jelly_EmailType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "email1Type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addEmail2" }) {
            parameters.addEmail2 = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "addEmail2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "email2" }) {
            parameters.email2 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "email2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "email2Type" }) {
            parameters.email2Type = Jelly_EmailType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "email2Type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addPhone1" }) {
            parameters.addPhone1 = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "addPhone1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "phone1" }) {
            parameters.phone1 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "phone1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "phone1Type" }) {
            parameters.phone1Type = Jelly_PhoneType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "phone1Type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addPhone2" }) {
            parameters.addPhone2 = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "addPhone2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "phone2" }) {
            parameters.phone2 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "phone2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "phone2Type" }) {
            parameters.phone2Type = Jelly_PhoneType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "phone2Type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addAddress1" }) {
            parameters.addAddress1 = Jelly_AddAddressType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "addAddress1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "address1" }) {
            parameters.address1 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "address1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location1" }) {
            parameters.location1 = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "location1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addAddress2" }) {
            parameters.addAddress2 = Jelly_AddAddressType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "addAddress2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "address2" }) {
            parameters.address2 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "address2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location2" }) {
            parameters.location2 = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "location2"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "birthday" }) {
            parameters.birthday = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "birthday"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "note" }) {
            parameters.note = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addContact", name: "note"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"lastName": "Zachary",
			"firstName": "Lineman",
			"jobTitle": "",
			"companyName": "",
			"image": "",
			"group": "",
			"addEmail1": "",
			"email1": "",
			"email1Type": "",
			"addEmail2": "",
			"email2": "",
			"email2Type": "",
			"addPhone1": "",
			"phone1": "",
			"phone1Type": "",
			"addPhone2": "",
			"phone2": "",
			"phone2Type": "",
			"addAddress1": "",
			"address1": "",
			"location1": "",
			"addAddress2": "",
			"address2": "",
			"location2": "",
			"url": "",
			"birthday": "",
			"note": "",

        ]
    }
}
