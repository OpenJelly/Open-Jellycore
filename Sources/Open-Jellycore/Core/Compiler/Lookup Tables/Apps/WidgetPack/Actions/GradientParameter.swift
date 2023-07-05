//
//  GradientParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GradientParameter: ParameterProtocol, Codable {
	var startColor: JellyVariableReference?
	var endColor: JellyVariableReference?
	var kind: Jelly_GradientKind?
	var linearStartPoint: Jelly_UnitPoint?
	var linearEndPoint: Jelly_UnitPoint?
	var radialCenter: Jelly_UnitPoint?
	var radialStartRadius: JellyDouble?
	var radialEndRadius: JellyDouble?
	var angularCenter: Jelly_UnitPoint?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GradientParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "startColor" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.startColor = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "startColor"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "endColor" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.endColor = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "endColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_GradientKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "linearStartPoint" }) {
            parameters.linearStartPoint = Jelly_UnitPoint(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "linearStartPoint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "linearEndPoint" }) {
            parameters.linearEndPoint = Jelly_UnitPoint(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "linearEndPoint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "radialCenter" }) {
            parameters.radialCenter = Jelly_UnitPoint(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "radialCenter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "radialStartRadius" }) {
            parameters.radialStartRadius = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "radialStartRadius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "radialEndRadius" }) {
            parameters.radialEndRadius = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "radialEndRadius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "angularCenter" }) {
            parameters.angularCenter = Jelly_UnitPoint(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "gradient", name: "angularCenter"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"startColor": "Main Color",
			"endColor": "End Color",
			"kind": "linear",
			"linearStartPoint": "UnitPoint(identifier: \"42\", displayString: \"42\")",
			"linearEndPoint": "UnitPoint(identifier: \"42\", displayString: \"42\")",
			"radialCenter": "UnitPoint(identifier: \"42\", displayString: \"42\")",
			"radialStartRadius": "42",
			"radialEndRadius": "42",
			"angularCenter": "UnitPoint(identifier: \"42\", displayString: \"42\")",

        ]
    }
}
