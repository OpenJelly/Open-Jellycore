//
//  TakeVideoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TakeVideoParameter: ParameterProtocol, Codable {
	var camera: Jelly_WFCameraCaptureDevice?
	var quality: Jelly_WFCameraCaptureQuality?
	var start: Jelly_WFRecordingStart?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TakeVideoParameter()

        if let value = call.first(where: { node in return node.slotName == "camera" }) {
            parameters.camera = Jelly_WFCameraCaptureDevice(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "takeVideo", name: "camera"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "quality" }) {
            parameters.quality = Jelly_WFCameraCaptureQuality(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "takeVideo", name: "quality"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "start" }) {
            parameters.start = Jelly_WFRecordingStart(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "takeVideo", name: "start"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"camera": "Back",
			"quality": "Medium",
			"start": "Imediately",

        ]
    }
}