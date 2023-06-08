//
//  ConsoleParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ConsoleParameter: ParameterProtocol, Codable {
	var consoleMode: Jelly_ConsoleMode?
	var notes: JellyArray<JellyVariableReference>?
	var retrievalType: Jelly_ConsoleRetrievalType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ConsoleParameter()

        if let value = call.first(where: { node in return node.slotName == "consoleMode" }) {
            parameters.consoleMode = Jelly_ConsoleMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "console", name: "consoleMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "notes" }) {
            parameters.notes = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "console", name: "notes"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "retrievalType" }) {
            parameters.retrievalType = Jelly_ConsoleRetrievalType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "console", name: "retrievalType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"consoleMode": "Print",
			"notes": "[\"Passed if statment 1\"]",
			"retrievalType": "IndividualEntries",

        ]
    }
}