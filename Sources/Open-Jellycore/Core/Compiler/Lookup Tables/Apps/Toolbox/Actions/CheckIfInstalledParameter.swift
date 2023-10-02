//
//  CheckIfInstalledParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CheckIfInstalledParameter: ParameterProtocol, Codable {
	var checkAppMode: Jelly_CheckAppMode?
	var app: Jelly_Apps?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CheckIfInstalledParameter()

        if let value = call.first(where: { node in return node.slotName == "checkAppMode" }) {
            parameters.checkAppMode = Jelly_CheckAppMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkIfInstalled", name: "checkAppMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "app" }) {
            parameters.app = Jelly_Apps(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "checkIfInstalled", name: "app"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"checkAppMode": "single app statuses as dictionary",
			"app": "Drafts 5",

        ]
    }
}
