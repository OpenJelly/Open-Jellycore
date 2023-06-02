//
//  ChangeCaseParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ChangeCaseParameter: ParameterProtocol, Codable {
	var text: JellyString?
	var `case`: Jelly_WFCaseType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ChangeCaseParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "changeCase", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "case" }) {
            parameters.case = Jelly_WFCaseType(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "changeCase", name: "case"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "ThE cAkE Is A LiE",
			"case": "Capitalize Every Word",

        ]
    }
}
