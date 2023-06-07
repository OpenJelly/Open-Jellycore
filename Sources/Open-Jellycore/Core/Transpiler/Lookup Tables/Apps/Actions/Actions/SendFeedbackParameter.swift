//
//  SendFeedbackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SendFeedbackParameter: ParameterProtocol, Codable {
	var message: JellyString?
	var email: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SendFeedbackParameter()

        if let value = call.first(where: { node in return node.slotName == "message" }) {
            parameters.message = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sendFeedback", name: "message"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "email" }) {
            parameters.email = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sendFeedback", name: "email"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"message": "Cool Actions!",
			"email": "jellycuts@gmail.com",

        ]
    }
}