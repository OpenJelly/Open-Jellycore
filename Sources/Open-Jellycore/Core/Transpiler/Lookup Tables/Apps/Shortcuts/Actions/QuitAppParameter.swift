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
            parameters.WFApp = ShortcutsApp(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quitApp", name: "app"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "askToSave" }) {
            parameters.WFAskToSaveChanges = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "quitApp", name: "askToSave"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"app": "com.zlineman.jellyfish",
			"askToSave": "true",

        ]
    }
}