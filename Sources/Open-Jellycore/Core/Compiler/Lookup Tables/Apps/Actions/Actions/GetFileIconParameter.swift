//
//  GetFileIconParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetFileIconParameter: ParameterProtocol, Codable {
	var files: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetFileIconParameter()

        if let value = call.first(where: { node in return node.slotName == "files" }) {
            parameters.files = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getFileIcon", name: "files"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"files": "[ShortcutInput]",

        ]
    }
}
