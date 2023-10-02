//
//  GetColoursParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetColoursParameter: ParameterProtocol, Codable {
	var mode: Jelly_ColourMode?
	var colour: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetColoursParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_ColourMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getColours", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "colour" }) {
            parameters.colour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getColours", name: "colour"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "single",
			"colour": "\"Blue\"",

        ]
    }
}
