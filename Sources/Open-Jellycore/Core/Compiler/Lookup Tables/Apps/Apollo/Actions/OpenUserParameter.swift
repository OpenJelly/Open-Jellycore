//
//  OpenUserParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenUserParameter: ParameterProtocol, Codable {
	var username: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenUserParameter()

        if let value = call.first(where: { node in return node.slotName == "username" }) {
            parameters.username = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "openUser", name: "username"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"username": "Zxtreme03",

        ]
    }
}
