//
//  PingServerParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PingServerParameter: ParameterProtocol, Codable {
	var url: JellyString?
	var output: Jelly_PingServerOutput?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PingServerParameter()

        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pingServer", name: "url"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "output" }) {
            parameters.output = Jelly_PingServerOutput(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "pingServer", name: "output"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"url": "\"https://jellycuts.com\"",
			"output": "statusCode",

        ]
    }
}