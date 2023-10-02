//
//  SetPropertyParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SetPropertyParameter: ParameterProtocol, Codable {
	var property: Jelly_Property?
	var backgroundView: Jelly_View?
	var backgroundAlignment: Jelly_Alignment?
	var overlayView: Jelly_View?
	var overlayAlignment: Jelly_Alignment?
	var foregroundColor: Jelly_View?
	var accentColor: Jelly_View?
	var padding: JellyDouble?
	var opacity: JellyDouble?
	var brightness: JellyDouble?
	var contrast: JellyDouble?
	var saturation: JellyDouble?
	var grayscale: JellyDouble?
	var font: Jelly_Font?
	var clipShape: Jelly_View?
	var mask: Jelly_View?
	var fixedFrameWidth: JellyDouble?
	var fixedFrameHeight: JellyDouble?
	var fixedFrameAlignment: Jelly_Alignment?
	var minimumScaleFactor: JellyDouble?
	var relativeFrameWidth: JellyDouble?
	var relativeFrameHeight: JellyDouble?
	var relativeFrameAlignment: Jelly_Alignment?
	var relativeFrameRelativeTo: Jelly_RelativeFrameRelativeTo?
	var fixedSizeHorizontal: JellyBoolean?
	var fixedSizeVertical: JellyBoolean?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SetPropertyParameter()

        if let value = call.first(where: { node in return node.slotName == "property" }) {
            parameters.property = Jelly_Property(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "property"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundView" }) {
            parameters.backgroundView = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "backgroundView"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundAlignment" }) {
            parameters.backgroundAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "backgroundAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overlayView" }) {
            parameters.overlayView = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "overlayView"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overlayAlignment" }) {
            parameters.overlayAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "overlayAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "foregroundColor" }) {
            parameters.foregroundColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "foregroundColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "accentColor" }) {
            parameters.accentColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "accentColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "padding" }) {
            parameters.padding = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "padding"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "opacity" }) {
            parameters.opacity = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "opacity"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "brightness" }) {
            parameters.brightness = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "brightness"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "contrast" }) {
            parameters.contrast = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "contrast"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "saturation" }) {
            parameters.saturation = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "saturation"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "grayscale" }) {
            parameters.grayscale = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "grayscale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "font" }) {
            parameters.font = Jelly_Font(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "font"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "clipShape" }) {
            parameters.clipShape = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "clipShape"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mask" }) {
            parameters.mask = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "mask"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedFrameWidth" }) {
            parameters.fixedFrameWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "fixedFrameWidth"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedFrameHeight" }) {
            parameters.fixedFrameHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "fixedFrameHeight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedFrameAlignment" }) {
            parameters.fixedFrameAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "fixedFrameAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "minimumScaleFactor" }) {
            parameters.minimumScaleFactor = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "minimumScaleFactor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameWidth" }) {
            parameters.relativeFrameWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "relativeFrameWidth"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameHeight" }) {
            parameters.relativeFrameHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "relativeFrameHeight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameAlignment" }) {
            parameters.relativeFrameAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "relativeFrameAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "relativeFrameRelativeTo" }) {
            parameters.relativeFrameRelativeTo = Jelly_RelativeFrameRelativeTo(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "relativeFrameRelativeTo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedSizeHorizontal" }) {
            parameters.fixedSizeHorizontal = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "fixedSizeHorizontal"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedSizeVertical" }) {
            parameters.fixedSizeVertical = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "fixedSizeVertical"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setProperty", name: "view"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"property": "background",
			"backgroundView": "View(identifier: \"View1\", displayString: \"View One\")",
			"backgroundAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"overlayView": "",
			"overlayAlignment": "",
			"foregroundColor": "",
			"accentColor": "",
			"padding": "",
			"opacity": "100",
			"brightness": "50",
			"contrast": "50",
			"saturation": "50",
			"grayscale": "50",
			"font": "",
			"clipShape": "",
			"mask": "",
			"fixedFrameWidth": "100",
			"fixedFrameHeight": "100",
			"fixedFrameAlignment": "",
			"minimumScaleFactor": "1.0",
			"relativeFrameWidth": "100",
			"relativeFrameHeight": "100",
			"relativeFrameAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"relativeFrameRelativeTo": "RelativeFrameRelativeTo(identifier: \"Relative\", displayString: \"Relative\")",
			"fixedSizeHorizontal": "100",
			"fixedSizeVertical": "100",
			"view": "",

        ]
    }
}
