//
//  ParameterizedRunScriptParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ParameterizedRunScriptParameter: ParameterProtocol, Codable {
	var fileName: JellyString?
	var parameter: JellyVariableReference?
	var texts: JellyArray<JellyVariableReference>?
	var urls: JellyArray<JellyString>?
	var images: JellyVariableReference?
	var files: JellyVariableReference?
	var runInApp: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ParameterizedRunScriptParameter()

        if let value = call.first(where: { node in return node.slotName == "fileName" }) {
            parameters.fileName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "fileName"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "parameter" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.parameter = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "parameter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "texts" }) {
            parameters.texts = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "texts"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "urls" }) {
            parameters.urls = JellyArray<JellyString>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "urls"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "images" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.images = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "images"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "files" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.files = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "runInApp" }) {
            parameters.runInApp = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "parameterizedRunScript", name: "runInApp"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"fileName": "Display",
			"parameter": "Clipboard",
			"texts": "[Red, Blue, Green]",
			"urls": "[\"https://jellycuts.com\"]",
			"images": "image",
			"files": "file",
			"runInApp": "false",

        ]
    }
}