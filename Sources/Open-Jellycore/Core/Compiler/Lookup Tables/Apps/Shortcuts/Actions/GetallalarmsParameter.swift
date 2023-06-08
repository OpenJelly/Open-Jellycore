//
//  GetallalarmsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetallalarmsParameter: ParameterProtocol, Codable {
	var ShowWhenRun: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetallalarmsParameter()

        if let value = call.first(where: { node in return node.slotName == "show" }) {
            parameters.ShowWhenRun = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getallalarms", name: "show"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"show": "false",

        ]
    }
}