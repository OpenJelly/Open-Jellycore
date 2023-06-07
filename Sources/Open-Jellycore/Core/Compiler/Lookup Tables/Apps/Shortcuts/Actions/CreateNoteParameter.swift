//
//  CreateNoteParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateNoteParameter: ParameterProtocol, Codable {
	var WFCreateNoteInput: JellyString?
	var ShowWhenRun: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateNoteParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFCreateNoteInput = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createNote", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "show" }) {
            parameters.ShowWhenRun = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createNote", name: "show"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "My new note text!",
			"show": "false",

        ]
    }
}