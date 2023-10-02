//
//  UnixTimeToDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UnixTimeToDateParameter: ParameterProtocol, Codable {
	var unixTime: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UnixTimeToDateParameter()

        if let value = call.first(where: { node in return node.slotName == "unixTime" }) {
            parameters.unixTime = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "unixTimeToDate", name: "unixTime"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"unixTime": "475454756",

        ]
    }
}
