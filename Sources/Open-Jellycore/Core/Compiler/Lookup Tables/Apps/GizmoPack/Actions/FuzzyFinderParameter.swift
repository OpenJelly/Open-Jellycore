//
//  FuzzyFinderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FuzzyFinderParameter: ParameterProtocol, Codable {
	var items: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FuzzyFinderParameter()

        if let value = call.first(where: { node in return node.slotName == "items" }) {
            parameters.items = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "fuzzyFinder", name: "items"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"items": "[\"Item\", \"${ShortcutInput}\"]",

        ]
    }
}