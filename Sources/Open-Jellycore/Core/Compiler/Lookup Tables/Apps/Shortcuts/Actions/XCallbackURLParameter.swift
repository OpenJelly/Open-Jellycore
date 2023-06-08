//
//  XCallbackURLParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct XCallbackURLParameter: ParameterProtocol, Codable {
	var WFXCallbackURL: JellyString?
	var WFXCallbackCustomCallbackEnabled: JellyBoolean?
	var WFXCallbackCustomSuccessKey: JellyString?
	var WFXCallbackCustomCancelKey: JellyString?
	var WFXCallbackCustomErrorKey: JellyString?
	var WFXCallbackCustomSuccessURLEnabled: JellyBoolean?
	var WFXCallbackCustomSuccessURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = XCallbackURLParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.WFXCallbackURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "custom" }) {
            parameters.WFXCallbackCustomCallbackEnabled = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "custom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "success" }) {
            parameters.WFXCallbackCustomSuccessKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "success"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "cancel" }) {
            parameters.WFXCallbackCustomCancelKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "cancel"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "error" }) {
            parameters.WFXCallbackCustomErrorKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "error"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customXSuccess" }) {
            parameters.WFXCallbackCustomSuccessURLEnabled = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "customXSuccess"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "xSuccess" }) {
            parameters.WFXCallbackCustomSuccessURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "xCallbackURL", name: "xSuccess"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "shortcuts://x-callback-url/run-shortcut?name=Calculate%20Tip&input=text&text=24.99.",
			"custom": "true",
			"success": "x-success",
			"cancel": "x-cancel",
			"error": "x-error",
			"customXSuccess": "false",
			"xSuccess": "shortcuts://callback",

        ]
    }
}