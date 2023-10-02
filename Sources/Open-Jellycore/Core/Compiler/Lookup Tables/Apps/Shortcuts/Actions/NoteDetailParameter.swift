//
//  NoteDetailParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct NoteDetailParameter: ParameterProtocol, Codable {
	var property: Jelly_WFContentItemPropertyName?
	var WFInput: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = NoteDetailParameter()

        if let value = call.first(where: { node in return node.slotName == "property" }) {
            parameters.property = Jelly_WFContentItemPropertyName(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "noteDetail", name: "property"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "note" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "noteDetail", name: "note"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"property": "Body",
			"note": "School Note",

        ]
    }
}
