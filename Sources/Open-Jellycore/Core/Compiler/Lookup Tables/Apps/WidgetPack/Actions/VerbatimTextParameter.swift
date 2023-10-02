//
//  VerbatimTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct VerbatimTextParameter: ParameterProtocol, Codable {
	var verbatim: JellyString?
	var font: Jelly_Font?
	var color: Jelly_View?
	var bold: JellyBoolean?
	var italic: JellyBoolean?
	var strikethrough: JellyBoolean?
	var strikethroughColor: Jelly_View?
	var underline: JellyBoolean?
	var underlineColor: Jelly_View?
	var kerning: JellyDouble?
	var tracking: JellyDouble?
	var baselineOffset: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = VerbatimTextParameter()

        if let value = call.first(where: { node in return node.slotName == "verbatim" }) {
            parameters.verbatim = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "verbatim"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "font" }) {
            parameters.font = Jelly_Font(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "font"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "color" }) {
            parameters.color = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "color"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bold" }) {
            parameters.bold = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "bold"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "italic" }) {
            parameters.italic = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "italic"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "strikethrough" }) {
            parameters.strikethrough = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "strikethrough"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "strikethroughColor" }) {
            parameters.strikethroughColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "strikethroughColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "underline" }) {
            parameters.underline = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "underline"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "underlineColor" }) {
            parameters.underlineColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "underlineColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "kerning" }) {
            parameters.kerning = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "kerning"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tracking" }) {
            parameters.tracking = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "tracking"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "baselineOffset" }) {
            parameters.baselineOffset = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "verbatimText", name: "baselineOffset"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"verbatim": "\"Main Page\"",
			"font": "Font(identifier: \"SF Pro\", displayString: \"SF Pro\")",
			"color": "View(identifier: \"View1\", displayString: \"View One\")",
			"bold": "true",
			"italic": "false",
			"strikethrough": "false",
			"strikethroughColor": "View(identifier: \"View1\", displayString: \"View One\")",
			"underline": "false",
			"underlineColor": "View(identifier: \"View1\", displayString: \"View One\")",
			"kerning": "0",
			"tracking": "0",
			"baselineOffset": "0",

        ]
    }
}
