//
//  DictateTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DictateTextParameter: ParameterProtocol, Codable {
	var language: Jelly_WFSpeechLanguage?
	var endTrigger: Jelly_WFDictateTextStopListening?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DictateTextParameter()

        if let value = call.first(where: { node in return node.slotName == "language" }) {
            parameters.language = Jelly_WFSpeechLanguage(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "dictateText", name: "language"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "endTrigger" }) {
            parameters.endTrigger = Jelly_WFDictateTextStopListening(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "dictateText", name: "endTrigger"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"language": "en-US",
			"endTrigger": "After Pause",

        ]
    }
}
