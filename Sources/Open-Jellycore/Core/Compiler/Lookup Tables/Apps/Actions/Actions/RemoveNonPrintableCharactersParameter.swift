//
//  RemoveNonPrintableCharactersParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RemoveNonPrintableCharactersParameter: ParameterProtocol, Codable {
	var text: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RemoveNonPrintableCharactersParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "removeNonPrintableCharacters", name: "text"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "T𝅸here ar e some h𝅸idde𝅸n cha𝅸rac ters in this tㅤext",

        ]
    }
}
