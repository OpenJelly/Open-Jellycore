//
//  ConnectToServersParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ConnectToServersParameter: ParameterProtocol, Codable {
	var WFInput: JellyArray<JellyString>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ConnectToServersParameter()

        if let value = call.first(where: { node in return node.slotName == "servers" }) {
            parameters.WFInput = JellyArray<JellyString>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "connectToServers", name: "servers"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"servers": "[\"Server URL\"]",

        ]
    }
}
