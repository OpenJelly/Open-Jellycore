//
//  aShell_GetFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct aShell_GetFileParameter: ParameterProtocol, Codable {
	var fileName: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = aShell_GetFileParameter()

        if let value = call.first(where: { node in return node.slotName == "fileName" }) {
            parameters.fileName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFile", name: "fileName"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"fileName": "HelloWorld.txt",

        ]
    }
}
