//
//  SeekPlaybackParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SeekPlaybackParameter: ParameterProtocol, Codable {
	var setPosition: Jelly_PlaybackPosition?
	var position: JellyInteger?
	var seekForward: JellyInteger?
	var seekBack: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SeekPlaybackParameter()

        if let value = call.first(where: { node in return node.slotName == "setPosition" }) {
            parameters.setPosition = Jelly_PlaybackPosition(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "seekPlayback", name: "setPosition"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "position" }) {
            parameters.position = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "seekPlayback", name: "position"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "seekForward" }) {
            parameters.seekForward = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "seekPlayback", name: "seekForward"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "seekBack" }) {
            parameters.seekBack = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "seekPlayback", name: "seekBack"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"setPosition": "seekToPosition",
			"position": "134",
			"seekForward": "",
			"seekBack": "",

        ]
    }
}
