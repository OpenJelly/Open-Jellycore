//
//  HideAllAppsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct HideAllAppsParameter: ParameterProtocol, Codable {
	var WFAppsExcept: JellyArray<ShortcutsApp>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = HideAllAppsParameter()

        if let value = call.first(where: { node in return node.slotName == "except" }) {
            parameters.WFAppsExcept = JellyArray<ShortcutsApp>(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hideAllApps", name: "except"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"except": "[\"com.zlineman.jellyfish\", \"com.apple.activitymonitor\"]",

        ]
    }
}