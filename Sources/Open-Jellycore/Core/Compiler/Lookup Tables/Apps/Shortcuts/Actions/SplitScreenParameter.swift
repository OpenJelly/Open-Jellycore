//
//  SplitScreenParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SplitScreenParameter: ParameterProtocol, Codable {
	var WFPrimaryAppIdentifier: ShortcutsApp?
	var WFSecondaryAppIdentifier: ShortcutsApp?
	var WFAppRatio: Jelly_WFAppRatio?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SplitScreenParameter()

        if let value = call.first(where: { node in return node.slotName == "appOne" }) {
            parameters.WFPrimaryAppIdentifier = ShortcutsApp(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "splitScreen", name: "appOne"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "appTwo" }) {
            parameters.WFSecondaryAppIdentifier = ShortcutsApp(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "splitScreen", name: "appTwo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "ratio" }) {
            parameters.WFAppRatio = Jelly_WFAppRatio(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "splitScreen", name: "ratio"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"appOne": "com.zlineman.jellyfish",
			"appTwo": "com.zlineman.jellyfish",
			"ratio": "half",

        ]
    }
}