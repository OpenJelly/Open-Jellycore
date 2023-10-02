//
//  SendMessageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SendMessageParameter: ParameterProtocol, Codable {
	var WFSendMessageContent: JellyString?
	var WFSendMessageActionRecipients: JellyVariableReference?
	var ShowWhenRun: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SendMessageParameter()

        if let value = call.first(where: { node in return node.slotName == "message" }) {
            parameters.WFSendMessageContent = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "sendMessage", name: "message"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "recipient" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFSendMessageActionRecipients = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "sendMessage", name: "recipient"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "show" }) {
            parameters.ShowWhenRun = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "sendMessage", name: "show"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"message": "Hello!",
			"recipient": "Recipient",
			"show": "false",

        ]
    }
}
