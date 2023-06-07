//
//  CreateIconParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateIconParameter: ParameterProtocol, Codable {
	var creationMode: Jelly_IconCreationMode?
	var defaultIcons: Jelly_DefaultIcons?
	var bgColour: Jelly_SystemColours?
	var iconColour: Jelly_SystemColours?
	var sfSymbolName: JellyString?
	var emojiName: JellyString?
	var iconColourHex: JellyString?
	var bgColourHex: JellyString?
	var emojiBgColourHex: JellyString?
	var maskType: Jelly_IconMaskType?
	var cornerRadius: JellyInteger?
	var bgTransparency: JellyDouble?
	var iconSize: JellyInteger?
	var scale: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateIconParameter()

        if let value = call.first(where: { node in return node.slotName == "creationMode" }) {
            parameters.creationMode = Jelly_IconCreationMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "creationMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "defaultIcons" }) {
            parameters.defaultIcons = Jelly_DefaultIcons(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "defaultIcons"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bgColour" }) {
            parameters.bgColour = Jelly_SystemColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "bgColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "iconColour" }) {
            parameters.iconColour = Jelly_SystemColours(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "iconColour"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sfSymbolName" }) {
            parameters.sfSymbolName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "sfSymbolName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "emojiName" }) {
            parameters.emojiName = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "emojiName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "iconColourHex" }) {
            parameters.iconColourHex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "iconColourHex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bgColourHex" }) {
            parameters.bgColourHex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "bgColourHex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "emojiBgColourHex" }) {
            parameters.emojiBgColourHex = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "emojiBgColourHex"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "maskType" }) {
            parameters.maskType = Jelly_IconMaskType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "maskType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "cornerRadius" }) {
            parameters.cornerRadius = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "cornerRadius"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "bgTransparency" }) {
            parameters.bgTransparency = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "bgTransparency"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "iconSize" }) {
            parameters.iconSize = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "iconSize"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "scale" }) {
            parameters.scale = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "createIcon", name: "scale"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"creationMode": "advanced",
			"defaultIcons": "",
			"bgColour": "Blue",
			"iconColour": "Blue",
			"sfSymbolName": "globe",
			"emojiName": "",
			"iconColourHex": "",
			"bgColourHex": "",
			"emojiBgColourHex": "",
			"maskType": "",
			"cornerRadius": "",
			"bgTransparency": "",
			"iconSize": "",
			"scale": "",

        ]
    }
}