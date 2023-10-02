//
//  RunScriptInlineParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RunScriptInlineParameter: ParameterProtocol, Codable {
	var script: JellyString?
	var parameter: JellyArray<JellyVariableReference>?
	var texts: JellyArray<JellyVariableReference>?
    var urls: JellyArray<JellyString>?
	var images: JellyArray<JellyVariableReference>?
	var files: JellyArray<JellyVariableReference>?
	var runInApp: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RunScriptInlineParameter()

        if let value = call.first(where: { node in return node.slotName == "script" }) {
            parameters.script = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "script"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "parameter" }) {
            parameters.parameter = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "parameter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "texts" }) {
            parameters.texts = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "texts"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "urls" }) {
            parameters.urls = JellyArray<JellyString>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "urls"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "images" }) {
            parameters.images = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "files" }) {
            parameters.files = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "runInApp" }) {
            parameters.runInApp = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "runScriptInline", name: "runInApp"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"script": "console.log('Hello World');",
			"parameter": "Clipboard",
			"texts": "[Red, Blue, Green]",
			"urls": "[\"https://jellycuts.com\"]",
			"images": "image",
			"files": "file",
			"runInApp": "false",

        ]
    }
}
