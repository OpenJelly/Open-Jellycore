//
//  GetIPParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetIPParameter: ParameterProtocol, Codable {
	var source: Jelly_WFIPAddressSourceOption?
	var type: Jelly_WFIPAddressTypeOption?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetIPParameter()

        if let value = call.first(where: { node in return node.slotName == "source" }) {
            parameters.source = Jelly_WFIPAddressSourceOption(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getIP", name: "source"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFIPAddressTypeOption(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getIP", name: "type"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"source": "External",
			"type": "IPv4",

        ]
    }
}
