//
//  CompleteItemParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CompleteItemParameter: ParameterProtocol, Codable {
	var item: Jelly_Item?
	var date: JellyDate?
	var skipped: JellyBoolean?
	var note: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CompleteItemParameter()

        if let value = call.first(where: { node in return node.slotName == "item" }) {
            parameters.item = Jelly_Item(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "completeItem", name: "item"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "completeItem", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "skipped" }) {
            parameters.skipped = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "completeItem", name: "skipped"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "note" }) {
            parameters.note = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "completeItem", name: "note"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"item": "Item(displayString: \"Pay Bills\", identifier: \"8E4E6CBE-5BEC-4E9E-8E82-495D8FF393C8\")",
			"date": "February 26th 2022",
			"skipped": "false",
			"note": "Hello World!",

        ]
    }
}
