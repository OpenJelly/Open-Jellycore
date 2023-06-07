//
//  ShapeParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ShapeParameter: ParameterProtocol, Codable {
	var kind: Jelly_ShapeKind?
	var radius: JellyDouble?
	var rotation: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ShapeParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_ShapeKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shape", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "radius" }) {
            parameters.radius = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shape", name: "radius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "rotation" }) {
            parameters.rotation = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "shape", name: "rotation"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "circle",
			"radius": "100",
			"rotation": "0",

        ]
    }
}