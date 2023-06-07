//
//  TakePhotoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct TakePhotoParameter: ParameterProtocol, Codable {
	var camera: Jelly_WFCameraCaptureDevice?
	var WFCameraCaptureShowPreview: JellyBoolean?
	var WFPhotoCount: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = TakePhotoParameter()

        if let value = call.first(where: { node in return node.slotName == "camera" }) {
            parameters.camera = Jelly_WFCameraCaptureDevice(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "takePhoto", name: "camera"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "preview" }) {
            parameters.WFCameraCaptureShowPreview = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "takePhoto", name: "preview"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "count" }) {
            parameters.WFPhotoCount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "takePhoto", name: "count"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"camera": "Back",
			"preview": "false",
			"count": "5",

        ]
    }
}