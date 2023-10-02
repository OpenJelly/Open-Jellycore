//
//  AddUpNextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddUpNextParameter: ParameterProtocol, Codable {
	var WFMusic: JellyVariableReference?
	var place: Jelly_WFWhenToPlay?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddUpNextParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "music" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFMusic = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addUpNext", name: "music"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "place" }) {
            parameters.place = Jelly_WFWhenToPlay(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "addUpNext", name: "place"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"music": "ShortcutInput",
			"place": "Next",

        ]
    }
}
