//
//  ImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ImageParameter: ParameterProtocol, Codable {
	var kind: Jelly_ImageKind?
	var systemImage: Jelly_SFSymbol?
	var image: JellyVariableReference?
	var resizable: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ImageParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_ImageKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "image", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "systemImage" }) {
            parameters.systemImage = Jelly_SFSymbol(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "image", name: "systemImage"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "image", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resizable" }) {
            parameters.resizable = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "image", name: "resizable"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "systemImage",
			"systemImage": "SFSymbol(identifier: \"bolt\", displayString: \"bolt\")",
			"image": "",
			"resizable": "true",

        ]
    }
}
