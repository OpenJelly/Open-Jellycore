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
            EventReporter.shared.reportError(error: .missingParameter(function: "loWoradWorkspace", name: "workspace"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"workspace": "Workspace(identifier: \"Default\", displayString: \"Default\", name: \"Default\")",

        ]
    }
}
