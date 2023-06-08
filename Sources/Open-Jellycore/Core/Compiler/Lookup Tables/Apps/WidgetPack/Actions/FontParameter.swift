//
//  FontParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FontParameter: ParameterProtocol, Codable {
	var kind: Jelly_FontKind?
	var size: JellyDouble?
	var weight: Jelly_FontWeight?
	var design: Jelly_FontDesign?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FontParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_FontKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "font", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "size" }) {
            parameters.size = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "font", name: "size"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "weight" }) {
            parameters.weight = Jelly_FontWeight(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "font", name: "weight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "design" }) {
            parameters.design = Jelly_FontDesign(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "font", name: "design"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "largeTitle",
			"size": "16",
			"weight": "FontWeight(identifier: \"Bold\", displayString: \"Bold\")",
			"design": "FontDesign(identifier: \"Rounded\", displayString: \"Rounded\")",

        ]
    }
}
