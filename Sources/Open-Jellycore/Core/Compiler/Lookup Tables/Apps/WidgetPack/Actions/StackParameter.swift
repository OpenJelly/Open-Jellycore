//
//  StackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct StackParameter: ParameterProtocol, Codable {
	var kind: Jelly_StackKind?
	var vstackAlignment: Jelly_HorizontalAlignment?
	var hstackAlignment: Jelly_VerticalAlignment?
	var zstackAlignment: Jelly_Alignment?
	var hstackSpacing: JellyDouble?
	var vstackSpacing: JellyDouble?
	var content: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = StackParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_StackKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "vstackAlignment" }) {
            parameters.vstackAlignment = Jelly_HorizontalAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "vstackAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hstackAlignment" }) {
            parameters.hstackAlignment = Jelly_VerticalAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "hstackAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "zstackAlignment" }) {
            parameters.zstackAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "zstackAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "hstackSpacing" }) {
            parameters.hstackSpacing = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "hstackSpacing"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "vstackSpacing" }) {
            parameters.vstackSpacing = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "vstackSpacing"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "content" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.content = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "stack", name: "content"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "horizontal",
			"vstackAlignment": "HorizontalAlignment(identifier: \"HorzontalAlign\", displayString: \"Horizontal Align\")",
			"hstackAlignment": "VerticalAlignment(identifier: \"VerticalAlign\", displayString: \"Vertical Align\")",
			"zstackAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"hstackSpacing": "15",
			"vstackSpacing": "15",
			"content": "My Views",

        ]
    }
}
