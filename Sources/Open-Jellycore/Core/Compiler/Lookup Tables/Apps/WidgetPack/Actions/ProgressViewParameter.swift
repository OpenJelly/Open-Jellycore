//
//  ProgressViewParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ProgressViewParameter: ParameterProtocol, Codable {
	var kind: Jelly_ProgressViewKind?
	var circularTint: Jelly_View?
	var linearTint: Jelly_View?
	var value: JellyDouble?
	var total: JellyDouble?
	var label: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ProgressViewParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_ProgressViewKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "progressView", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "circularTint" }) {
            parameters.circularTint = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "progressView", name: "circularTint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "linearTint" }) {
            parameters.linearTint = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "progressView", name: "linearTint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "value" }) {
            parameters.value = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "progressView", name: "value"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "total" }) {
            parameters.total = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "progressView", name: "total"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "label" }) {
            parameters.label = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "progressView", name: "label"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "linear",
			"circularTint": "View(identifier: \"View1\", displayString: \"View One\")",
			"linearTint": "View(identifier: \"View1\", displayString: \"View One\")",
			"value": "42",
			"total": "100",
			"label": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
