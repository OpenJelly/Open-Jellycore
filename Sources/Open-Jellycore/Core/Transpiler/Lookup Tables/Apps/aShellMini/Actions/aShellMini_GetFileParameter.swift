//
//  aShellMini_GetFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct aShellMini_GetFileParameter: ParameterProtocol, Codable {
	var fileName: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = aShellMini_GetFileParameter()

        if let value = call.first(where: { node in return node.slotName == "fileName" }) {
            parameters.fileName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getFile", name: "fileName"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"fileName": "HelloWorld.txt",

        ]
    }
}
