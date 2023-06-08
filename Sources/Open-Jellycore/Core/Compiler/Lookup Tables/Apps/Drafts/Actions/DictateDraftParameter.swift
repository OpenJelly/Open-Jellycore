//
//  DictateDraftParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DictateDraftParameter: ParameterProtocol, Codable {
	var DraftsLocale: Jelly_DraftsLocale?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DictateDraftParameter()

        if let value = call.first(where: { node in return node.slotName == "DraftsLocale" }) {
            parameters.DraftsLocale = Jelly_DraftsLocale(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "dictateDraft", name: "DraftsLocale"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"DraftsLocale": "DraftsLocale(identifier: \"English (United States)\", identifier: \"en-US\")",

        ]
    }
}
