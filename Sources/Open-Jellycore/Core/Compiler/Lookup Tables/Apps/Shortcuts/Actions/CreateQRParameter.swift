//
//  CreateQRParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateQRParameter: ParameterProtocol, Codable {
	var WFText: JellyString?
	var correction: Jelly_WFQRErrorCorrectionLevel?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateQRParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.WFText = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createQR", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "correction" }) {
            parameters.correction = Jelly_WFQRErrorCorrectionLevel(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createQR", name: "correction"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
			"correction": "Medium",

        ]
    }
}
