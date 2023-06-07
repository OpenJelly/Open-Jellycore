//
//  LabelFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct LabelFileParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFLabelColorNumber: Jelly_WFLabelColorNumber?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = LabelFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "files" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "labelFile", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "color" }) {
            parameters.WFLabelColorNumber = Jelly_WFLabelColorNumber(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "labelFile", name: "color"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "ShortcutInput",
			"color": "Red",

        ]
    }
}