//
//  MakeDiskImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct MakeDiskImageParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var VolumeName: JellyString?
	var EncryptImage: JellyBoolean?
	var SizeToFit: JellyBoolean?
	var ImageSize: ShortcutsQuantity?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = MakeDiskImageParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "files" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "makeDiskImage", name: "files"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.VolumeName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "makeDiskImage", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "encrypt" }) {
            parameters.EncryptImage = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "makeDiskImage", name: "encrypt"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sizetofit" }) {
            parameters.SizeToFit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "makeDiskImage", name: "sizetofit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "size" }) {
            parameters.ImageSize = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "makeDiskImage", name: "size"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "Ask",
			"name": "New Volume",
			"encrypt": "true",
			"sizetofit": "false",
			"size": "16 GB",

        ]
    }
}