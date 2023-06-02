//
//  HideAppParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct HideAppParameter: ParameterProtocol, Codable {
	var WFApp: ShortcutsApp?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = HideAppParameter()

        if let value = call.first(where: { node in return node.slotName == "app" }) {
            parameters.WFApp = ShortcutsApp(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hideApp", name: "app"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"app": "com.zlineman.jellyfish",

        ]
    }
}