//
//  CreateTextImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateTextImageParameter: ParameterProtocol, Codable {
	var inputType: Jelly_TextInputType?
	var richText: JellyVariableReference?
	var text: JellyArray<JellyVariableReference>?
	var font: JellyString?
	var fontSize: JellyInteger?
	var textColour: JellyString?
	var alignment: Jelly_TextAlignment?
	var backgroundColour: JellyString?
	var transparentBG: JellyBoolean?
	var autoSize: JellyBoolean?
	var width: JellyInteger?
	var height: JellyInteger?
	var paddingLeft: JellyInteger?
	var paddingRight: JellyInteger?
	var paddingTop: JellyInteger?
	var paddingBottom: JellyInteger?
	var scaleToFit: JellyBoolean?
	var lineLimit: JellyBoolean?
	var lineCount: JellyInteger?
	var addShadow: JellyBoolean?
	var shadowColour: JellyString?
	var xOffset: JellyInteger?
	var yOffset: JellyInteger?
	var lineBreak: Jelly_LineBreakMode?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateTextImageParameter()

        if let value = call.first(where: { node in return node.slotName == "inputType" }) {
            parameters.inputType = Jelly_TextInputType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "inputType"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "richText" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.richText = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "richText"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "font" }) {
            parameters.font = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "font"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fontSize" }) {
            parameters.fontSize = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "fontSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "textColour" }) {
            parameters.textColour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "textColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "alignment" }) {
            parameters.alignment = Jelly_TextAlignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "alignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundColour" }) {
            parameters.backgroundColour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "backgroundColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "transparentBG" }) {
            parameters.transparentBG = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "transparentBG"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "autoSize" }) {
            parameters.autoSize = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "autoSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.width = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.height = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "height"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "paddingLeft" }) {
            parameters.paddingLeft = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "paddingLeft"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "paddingRight" }) {
            parameters.paddingRight = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "paddingRight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "paddingTop" }) {
            parameters.paddingTop = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "paddingTop"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "paddingBottom" }) {
            parameters.paddingBottom = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "paddingBottom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scaleToFit" }) {
            parameters.scaleToFit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "scaleToFit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "lineLimit" }) {
            parameters.lineLimit = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "lineLimit"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "lineCount" }) {
            parameters.lineCount = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "lineCount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addShadow" }) {
            parameters.addShadow = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "addShadow"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "shadowColour" }) {
            parameters.shadowColour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "shadowColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "xOffset" }) {
            parameters.xOffset = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "xOffset"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "yOffset" }) {
            parameters.yOffset = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "yOffset"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "lineBreak" }) {
            parameters.lineBreak = Jelly_LineBreakMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createTextImage", name: "lineBreak"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"inputType": "PlainText",
			"richText": "",
			"text": "\"Hello World\"",
			"font": "\"Arial\"",
			"fontSize": "32",
			"textColour": "\"#ffffff\"",
			"alignment": "centre",
			"backgroundColour": "\"#000000\"",
			"transparentBG": "false",
			"autoSize": "true",
			"width": "",
			"height": "",
			"paddingLeft": "",
			"paddingRight": "",
			"paddingTop": "",
			"paddingBottom": "",
			"scaleToFit": "",
			"lineLimit": "",
			"lineCount": "",
			"addShadow": "",
			"shadowColour": "",
			"xOffset": "",
			"yOffset": "",
			"lineBreak": "",

        ]
    }
}