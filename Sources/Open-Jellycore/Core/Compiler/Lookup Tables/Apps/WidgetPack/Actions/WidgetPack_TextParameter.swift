//
//  WidgetPack_TextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct WidgetPack_TextParameter: ParameterProtocol, Codable {
	var kind: Jelly_TextKind?
	var verbatim: JellyString?
	var date: JellyDate?
	var dateStyle: Jelly_TextDateStyle?
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
        var parameters = WidgetPack_TextParameter()

        if let value = call.first(where: { node in return node.slotName == "kind" }) {
            parameters.kind = Jelly_TextKind(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "kind"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "verbatim" }) {
            parameters.verbatim = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "verbatim"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dateStyle" }) {
            parameters.dateStyle = Jelly_TextDateStyle(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "dateStyle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "font" }) {
            parameters.font = Jelly_Font(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "font"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "color" }) {
            parameters.color = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "color"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bold" }) {
            parameters.bold = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "bold"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "italic" }) {
            parameters.italic = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "italic"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "strikethrough" }) {
            parameters.strikethrough = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "strikethrough"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "strikethroughColor" }) {
            parameters.strikethroughColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "strikethroughColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "underline" }) {
            parameters.underline = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "underline"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "underlineColor" }) {
            parameters.underlineColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "underlineColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "kerning" }) {
            parameters.kerning = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "kerning"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tracking" }) {
            parameters.tracking = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "tracking"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "baselineOffset" }) {
            parameters.baselineOffset = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "text", name: "baselineOffset"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"kind": "verbatim",
			"verbatim": "\"Awesome Sauce\"",
			"date": "February 26th 2022",
			"dateStyle": "TextDateStyle(identifier: \"Style\", displayString: \"Style\")",
			"font": "Font(identifier: \"SF Pro\", displayString: \"SF Pro\")",
			"color": "View(identifier: \"View1\", displayString: \"View One\")",
			"bold": "true",
			"italic": "false",
			"strikethrough": "false",
			"strikethroughColor": "",
			"underline": "false",
			"underlineColor": "",
			"kerning": "0.0",
			"tracking": "0.0",
			"baselineOffset": "0.0",

        ]
    }
}
