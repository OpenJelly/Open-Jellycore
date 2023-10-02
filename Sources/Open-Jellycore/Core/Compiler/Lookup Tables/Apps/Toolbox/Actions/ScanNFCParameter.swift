//
//  ScanNFCParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ScanNFCParameter: ParameterProtocol, Codable {
	var mode: Jelly_NFCMode?
	var text: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ScanNFCParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_NFCMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "scanNFC", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "scanNFC", name: "text"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "Read",
			"text": "[]",

        ]
    }
}
