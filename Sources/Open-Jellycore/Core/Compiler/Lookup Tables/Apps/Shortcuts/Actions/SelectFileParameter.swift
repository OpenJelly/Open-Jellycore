//
//  SelectFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SelectFileParameter: ParameterProtocol, Codable {
	var type: Jelly_WFPickingMode?
	var SelectMultiple: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SelectFileParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFPickingMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "selectFile", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "multiple" }) {
            parameters.SelectMultiple = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "selectFile", name: "multiple"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "Files",
			"multiple": "false",

        ]
    }
}
