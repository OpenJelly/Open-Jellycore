//
//  HapticFeedbackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct HapticFeedbackParameter: ParameterProtocol, Codable {
	var feedbackType: Jelly_HapticFeedbackType?
	var vibrateIfUnsupported: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = HapticFeedbackParameter()

        if let value = call.first(where: { node in return node.slotName == "feedbackType" }) {
            parameters.feedbackType = Jelly_HapticFeedbackType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hapticFeedback", name: "feedbackType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "vibrateIfUnsupported" }) {
            parameters.vibrateIfUnsupported = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hapticFeedback", name: "vibrateIfUnsupported"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"feedbackType": "success",
			"vibrateIfUnsupported": "false",

        ]
    }
}