//
//  ChangeWallpaperParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ChangeWallpaperParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFWallpaperLocation: JellyArray<Jelly_WFWallpaperLocation>?
	var WFWallpaperShowPreview: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ChangeWallpaperParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "changeWallpaper", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.WFWallpaperLocation = JellyArray<Jelly_WFWallpaperLocation>(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "changeWallpaper", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "preview" }) {
            parameters.WFWallpaperShowPreview = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "changeWallpaper", name: "preview"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",
			"location": "[Lock Screen, Home Screen]",
			"preview": "false",

        ]
    }
}
