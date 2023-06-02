//
//  GetMatchGroupParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetMatchGroupParameter: ParameterProtocol, Codable {
	var type: Jelly_WFGetGroupType?
	var matches: JellyVariableReference?
	var WFGroupIndex: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetMatchGroupParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFGetGroupType(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getMatchGroup", name: "type"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "matches" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.matches = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getMatchGroup", name: "matches"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "index" }) {
            parameters.WFGroupIndex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getMatchGroup", name: "index"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "Group At Index",
			"matches": "ShortcutInput",
			"index": "2",

        ]
    }
}