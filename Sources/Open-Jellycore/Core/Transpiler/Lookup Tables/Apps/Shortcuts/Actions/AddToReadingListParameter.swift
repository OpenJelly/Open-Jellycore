//
//  AddToReadingListParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct AddToReadingListParameter: ParameterProtocol, Codable {
	var WFURL: JellyArray<JellyVariableReference>?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = AddToReadingListParameter()

        if let value = call.first(where: { node in return node.slotName == "urls" }) {
            parameters.WFURL = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "addToReadingList", name: "urls"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"urls": "https://jellycuts.com",

        ]
    }
}