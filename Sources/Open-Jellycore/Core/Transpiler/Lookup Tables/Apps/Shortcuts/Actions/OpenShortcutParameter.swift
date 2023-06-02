//
//  OpenShortcutParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenShortcutParameter: ParameterProtocol, Codable {
    var WFWorkflow: ShortcutsWorkflow?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenShortcutParameter()

        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.WFWorkflow = ShortcutsWorkflow(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openShortcut", name: "name"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"name": "Jellycuts Helper",

        ]
    }
}
