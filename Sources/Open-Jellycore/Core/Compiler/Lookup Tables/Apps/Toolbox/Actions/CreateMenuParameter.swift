//
//  CreateMenuParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateMenuParameter: ParameterProtocol, Codable {
	var customIconType: Jelly_IconType?
	var defaultIcons: Jelly_DefaultIcons?
	var customIcon: JellyVariableReference?
	var sfSymbolName: JellyString?
	var emojiName: JellyString?
	var iconColour: JellyString?
	var backgroundColour: JellyString?
	var emojiBG: JellyString?
	var imageURL: JellyString?
	var defaultBGColour: Jelly_SystemColours?
	var defaultIconColour: Jelly_SystemColours?
	var bgTransparency: JellyDouble?
	var bgTransparencyEmoji: JellyDouble?
	var base64: JellyString?
	var sfScale: JellyDouble?
	var defaultScale: JellyDouble?
	var title: JellyString?
	var subtitle: JellyString?
	var field1: JellyString?
	var field2: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateMenuParameter()

        if let value = call.first(where: { node in return node.slotName == "customIconType" }) {
            parameters.customIconType = Jelly_IconType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "customIconType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "defaultIcons" }) {
            parameters.defaultIcons = Jelly_DefaultIcons(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "defaultIcons"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "customIcon" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.customIcon = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "customIcon"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sfSymbolName" }) {
            parameters.sfSymbolName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "sfSymbolName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "emojiName" }) {
            parameters.emojiName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "emojiName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "iconColour" }) {
            parameters.iconColour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "iconColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundColour" }) {
            parameters.backgroundColour = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "backgroundColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "emojiBG" }) {
            parameters.emojiBG = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "emojiBG"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "imageURL" }) {
            parameters.imageURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "imageURL"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "defaultBGColour" }) {
            parameters.defaultBGColour = Jelly_SystemColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "defaultBGColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "defaultIconColour" }) {
            parameters.defaultIconColour = Jelly_SystemColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "defaultIconColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bgTransparency" }) {
            parameters.bgTransparency = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "bgTransparency"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bgTransparencyEmoji" }) {
            parameters.bgTransparencyEmoji = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "bgTransparencyEmoji"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "base64" }) {
            parameters.base64 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "base64"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sfScale" }) {
            parameters.sfScale = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "sfScale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "defaultScale" }) {
            parameters.defaultScale = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "defaultScale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "subtitle" }) {
            parameters.subtitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "subtitle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "field1" }) {
            parameters.field1 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "field1"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "field2" }) {
            parameters.field2 = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createMenu", name: "field2"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"customIconType": "emoji",
			"defaultIcons": "\"\"",
			"customIcon": "",
			"sfSymbolName": "\"\"",
			"emojiName": "\"Rocket\"",
			"iconColour": "\"\"",
			"backgroundColour": "\"\"",
			"emojiBG": "\"🚀\"",
			"imageURL": "\"\"",
			"defaultBGColour": "Yellow",
			"defaultIconColour": "Blue",
			"bgTransparency": "1",
			"bgTransparencyEmoji": "0.5",
			"base64": "\"\"",
			"sfScale": "0.5",
			"defaultScale": "0.5",
			"title": "\"My Cool Menu Item\"",
			"subtitle": "\"This is a cool menu item\"",
			"field1": "\"Really Cool Field\"",
			"field2": "\"Some Data\"",

        ]
    }
}