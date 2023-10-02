//
//  GetTBPToolsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetTBPToolsParameter: ParameterProtocol, Codable {
	var category: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetTBPToolsParameter()

        if let value = call.first(where: { node in return node.slotName == "category" }) {
            parameters.category = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getTBPTools", name: "category"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"category": "\"System\"",

        ]
    }
}
