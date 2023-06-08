//
//  RandomDataParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RandomDataParameter: ParameterProtocol, Codable {
	var size: JellyInteger?
	var outputEncoding: Jelly_BinaryOutputEncoding?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RandomDataParameter()

        if let value = call.first(where: { node in return node.slotName == "size" }) {
            parameters.size = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomData", name: "size"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "outputEncoding" }) {
            parameters.outputEncoding = Jelly_BinaryOutputEncoding(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "randomData", name: "outputEncoding"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"size": "12043",
			"outputEncoding": "binary",

        ]
    }
}