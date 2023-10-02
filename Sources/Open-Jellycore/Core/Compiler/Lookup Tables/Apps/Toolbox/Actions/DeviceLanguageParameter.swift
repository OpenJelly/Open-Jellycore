//
//  DeviceLanguageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DeviceLanguageParameter: ParameterProtocol, Codable {
	var languageType: Jelly_LanguageTypes?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DeviceLanguageParameter()

        if let value = call.first(where: { node in return node.slotName == "languageType" }) {
            parameters.languageType = Jelly_LanguageTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "deviceLanguage", name: "languageType"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"languageType": "DeviceLocale",

        ]
    }
}
