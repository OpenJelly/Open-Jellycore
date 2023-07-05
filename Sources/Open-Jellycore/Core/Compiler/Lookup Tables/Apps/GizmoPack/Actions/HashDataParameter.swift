//
//  HashDataParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct HashDataParameter: ParameterProtocol, Codable {
	var input: JellyVariableReference?
	var algorithm: Jelly_HashDataAlgorithm?
	var hmacMd5Key: JellyVariableReference?
	var hmacSha1Key: JellyVariableReference?
	var hmacSha224Key: JellyVariableReference?
	var hmacSha256Key: JellyVariableReference?
	var hmacSha384Key: JellyVariableReference?
	var hmacSha512Key: JellyVariableReference?
	var outputEncoding: Jelly_BinaryOutputEncoding?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = HashDataParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.input = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "algorithm" }) {
            parameters.algorithm = Jelly_HashDataAlgorithm(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "algorithm"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "hmacMd5Key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.hmacMd5Key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "hmacMd5Key"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "hmacSha1Key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.hmacSha1Key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "hmacSha1Key"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "hmacSha224Key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.hmacSha224Key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "hmacSha224Key"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "hmacSha256Key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.hmacSha256Key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "hmacSha256Key"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "hmacSha384Key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.hmacSha384Key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "hmacSha384Key"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "hmacSha512Key" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.hmacSha512Key = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "hmacSha512Key"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "outputEncoding" }) {
            parameters.outputEncoding = Jelly_BinaryOutputEncoding(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "hashData", name: "outputEncoding"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "ShortcutInput",
			"algorithm": "md5",
			"hmacMd5Key": "Q348WQAYDUNBQ3RRisd",
			"hmacSha1Key": "\"\"",
			"hmacSha224Key": "\"\"",
			"hmacSha256Key": "\"\"",
			"hmacSha384Key": "\"\"",
			"hmacSha512Key": "\"\"",
			"outputEncoding": "binary",

        ]
    }
}