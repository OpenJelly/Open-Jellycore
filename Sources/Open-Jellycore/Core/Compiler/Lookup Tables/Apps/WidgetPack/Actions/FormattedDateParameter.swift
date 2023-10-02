//
//  FormattedDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormattedDateParameter: ParameterProtocol, Codable {
	var dateDate: JellyDate?
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
        var parameters = FormattedDateParameter()

        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.dateDate = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dateStyle" }) {
            parameters.dateStyle = Jelly_TextDateStyle(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "dateStyle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "font" }) {
            parameters.font = Jelly_Font(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "font"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "color" }) {
            parameters.color = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "color"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bold" }) {
            parameters.bold = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "bold"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "italic" }) {
            parameters.italic = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "italic"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "strikethrough" }) {
            parameters.strikethrough = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "strikethrough"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "strikethroughColor" }) {
            parameters.strikethroughColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "strikethroughColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "underline" }) {
            parameters.underline = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "underline"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "underlineColor" }) {
            parameters.underlineColor = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "underlineColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "kerning" }) {
            parameters.kerning = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "kerning"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tracking" }) {
            parameters.tracking = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "tracking"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "baselineOffset" }) {
            parameters.baselineOffset = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "formattedDate", name: "baselineOffset"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "February 26th 2022",
			"dateStyle": "TextDateStyle(identifier: \"Style\", displayString: \"Style\")",
			"font": "Font(identifier: \"SF Pro\", displayString: \"SF Pro\")",
			"color": "View(identifier: \"View1\", displayString: \"View One\")",
			"bold": "false",
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
