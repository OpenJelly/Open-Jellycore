//
//  FormatSizeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatSizeParameter: ParameterProtocol, Codable {
	var FormatSize: JellyDouble?
	var format: Jelly_WFFileSizeFormat?
	var WFFileSizeIncludeUnits: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatSizeParameter()

        if let value = call.first(where: { node in return node.slotName == "size" }) {
            parameters.FormatSize = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatSize", name: "size"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "format" }) {
            parameters.format = Jelly_WFFileSizeFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatSize", name: "format"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "units" }) {
            parameters.WFFileSizeIncludeUnits = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatSize", name: "units"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"size": "32324241424",
			"format": "Gigabytes",
			"units": "false",

        ]
    }
}