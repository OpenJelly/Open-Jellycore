//
//  SignJWTParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SignJWTParameter: ParameterProtocol, Codable {
	var key: JellyVariableReference?
	var algorithm: Jelly_JWTAlgorithm?
	var issuer: JellyString?
	var keyID: JellyString?
	var audience: JellyArray<JellyVariableReference>?
	var notBefore: ShortcutsQuantity?
	var expiration: ShortcutsQuantity?
	var subject: JellyString?
	var jwtID: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SignJWTParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "key"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "algorithm" }) {
            parameters.algorithm = Jelly_JWTAlgorithm(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "algorithm"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "issuer" }) {
            parameters.issuer = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "issuer"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keyID" }) {
            parameters.keyID = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "keyID"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "audience" }) {
            parameters.audience = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "audience"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "notBefore" }) {
            parameters.notBefore = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "notBefore"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "expiration" }) {
            parameters.expiration = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "expiration"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "subject" }) {
            parameters.subject = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "subject"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "jwtID" }) {
            parameters.jwtID = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "signJWT", name: "jwtID"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"key": "ShortcutInput",
			"algorithm": "es256",
			"issuer": "Me",
			"keyID": "123dsa",
			"audience": "[\"Test\", \"Test\"]",
			"notBefore": "10 hours",
			"expiration": "12 hours",
			"subject": "\"Generated using GizmoPack!\"",
			"jwtID": "13478adsfio13u0hadj",

        ]
    }
}
