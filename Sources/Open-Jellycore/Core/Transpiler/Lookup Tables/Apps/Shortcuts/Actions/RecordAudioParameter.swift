//
//  RecordAudioParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct RecordAudioParameter: ParameterProtocol, Codable {
	var quality: Jelly_WFRecordingCompression?
	var start: Jelly_WFRecordingStart?
	var end: Jelly_WFRecordingEnd?
	var WFRecordingTimeInterval: ShortcutsQuantity?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = RecordAudioParameter()

        if let value = call.first(where: { node in return node.slotName == "quality" }) {
            parameters.quality = Jelly_WFRecordingCompression(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recordAudio", name: "quality"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "start" }) {
            parameters.start = Jelly_WFRecordingStart(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recordAudio", name: "start"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "end" }) {
            parameters.end = Jelly_WFRecordingEnd(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recordAudio", name: "end"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "duration" }) {
            parameters.WFRecordingTimeInterval = ShortcutsQuantity(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "recordAudio", name: "duration"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"quality": "Normal",
			"start": "On Tap",
			"end": "After Time",
			"duration": "10 min 15 sec",

        ]
    }
}
