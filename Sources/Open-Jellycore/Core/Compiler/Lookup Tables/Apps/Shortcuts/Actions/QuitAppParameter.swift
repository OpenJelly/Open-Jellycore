//
//  QuitAppParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct QuitAppParameter: ParameterProtocol, Codable {
	var WFApp: ShortcutsApp?
	var WFAskToSaveChanges: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = QuitAppParameter()

        if let value = call.first(where: { node in return node.slotName == "app" }) {
            parameters.WFApp = ShortcutsApp(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quitApp", name: "app"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "askToSave" }) {
            parameters.WFAskToSaveChanges = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "quitApp", name: "askToSave"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"app": "com.zlineman.jellyfish",
			"askToSave": "true",

        ]
    }
}
