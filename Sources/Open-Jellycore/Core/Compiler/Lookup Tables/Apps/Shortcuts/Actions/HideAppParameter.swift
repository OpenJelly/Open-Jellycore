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
            parameters.WFApp = ShortcutsApp(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "hideApp", name: "app"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"app": "com.zlineman.jellyfish",

        ]
    }
}
