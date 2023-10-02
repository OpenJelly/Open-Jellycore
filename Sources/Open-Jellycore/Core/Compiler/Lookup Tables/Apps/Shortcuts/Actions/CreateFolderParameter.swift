//
//  CreateFolderParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateFolderParameter: ParameterProtocol, Codable {
	var WFFilePath: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateFolderParameter()

        if let value = call.first(where: { node in return node.slotName == "path" }) {
            parameters.WFFilePath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createFolder", name: "path"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"path": "JellycutsHelper",

        ]
    }
}
