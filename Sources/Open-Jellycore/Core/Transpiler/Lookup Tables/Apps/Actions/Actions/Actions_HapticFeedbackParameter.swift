//
//  Actions_HapticFeedbackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct Actions_HapticFeedbackParameter: ParameterProtocol, Codable {
	var type: Actions_Jelly_HapticFeedbackType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = Actions_HapticFeedbackParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Actions_Jelly_HapticFeedbackType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hapticFeedback", name: "type"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "success",

        ]
    }
}
