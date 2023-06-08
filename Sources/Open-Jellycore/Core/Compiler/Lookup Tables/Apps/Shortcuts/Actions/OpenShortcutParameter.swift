//
//  OpenShortcutParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenShortcutParameter: ParameterProtocol, Codable {
	var WFWorkflow: ShortcutsApp?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenShortcutParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFWorkflow = ShortcutsApp(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openShortcut", name: "name"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "Jellycuts Helper",

        ]
    }
}