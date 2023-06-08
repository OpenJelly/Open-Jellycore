//
//  MovenotestofolderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MovenotestofolderParameter: ParameterProtocol, Codable {
	var WFOutput: JellyString?
	var folder: Jelly_WFNoOutputSurfaceBehavior?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MovenotestofolderParameter()

        if let value = call.first(where: { node in return node.slotName == "notes" }) {
            parameters.WFOutput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "movenotestofolder", name: "notes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "folder" }) {
            parameters.folder = Jelly_WFNoOutputSurfaceBehavior(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "movenotestofolder", name: "folder"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"notes": "ShortcutInput",
			"folder": "Respond",

        ]
    }
}