//
//  LoWoradWorkspaceParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct LoWoradWorkspaceParameter: ParameterProtocol, Codable {
	var workspace: Jelly_Workspace?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = LoWoradWorkspaceParameter()

        if let value = call.first(where: { node in return node.slotName == "workspace" }) {
            parameters.workspace = Jelly_Workspace(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "loWoradWorkspace", name: "workspace"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"workspace": "Workspace(identifier: \"Default\", displayString: \"Default\", name: \"Default\")",

        ]
    }
}
