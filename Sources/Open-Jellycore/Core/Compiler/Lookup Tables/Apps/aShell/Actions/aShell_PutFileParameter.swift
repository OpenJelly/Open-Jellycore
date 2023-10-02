//
//  aShell_PutFileParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct aShell_PutFileParameter: ParameterProtocol, Codable {
	var file: JellyVariableReference?
	var overwrite: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = aShell_PutFileParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "file" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.file = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "putFile", name: "file"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overwrite" }) {
            parameters.overwrite = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "putFile", name: "overwrite"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"file": "HelloWorld.txt",
			"overwrite": "true",

        ]
    }
}
