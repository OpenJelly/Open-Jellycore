//
//  QueryWorkspaceParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QueryWorkspaceParameter: ParameterProtocol, Codable {
	var workspace: Jelly_Workspace?
	var folder: Jelly_DraftResponseFolder?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QueryWorkspaceParameter()

        if let value = call.first(where: { node in return node.slotName == "workspace" }) {
            parameters.workspace = Jelly_Workspace(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryWorkspace", name: "workspace"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "folder" }) {
            parameters.folder = Jelly_DraftResponseFolder(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "queryWorkspace", name: "folder"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"workspace": "Workspace(identifier: \"Default\", displayString: \"Default\", name: \"Default\")",
			"folder": "inbox",

        ]
    }
}
