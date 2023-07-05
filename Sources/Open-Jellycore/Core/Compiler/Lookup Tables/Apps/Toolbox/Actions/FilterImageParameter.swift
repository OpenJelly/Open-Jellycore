//
//  FilterImageParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FilterImageParameter: ParameterProtocol, Codable {
	var filter: Jelly_FilterType?
	var sepiaIntensity: JellyDouble?
	var pixellateAmount: JellyDouble?
	var desatRedTint: JellyDouble?
	var desatGreenTint: JellyDouble?
	var desatBlueTint: JellyDouble?
	var blurStrength: JellyDouble?
	var blurType: Jelly_BlurTypes?
	var image: JellyVariableReference?
	var resizeImage: JellyBoolean?
	var resizeLongestSideTo: JellyInteger?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FilterImageParameter()

        if let value = call.first(where: { node in return node.slotName == "filter" }) {
            parameters.filter = Jelly_FilterType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "filter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "sepiaIntensity" }) {
            parameters.sepiaIntensity = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "sepiaIntensity"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pixellateAmount" }) {
            parameters.pixellateAmount = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "pixellateAmount"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "desatRedTint" }) {
            parameters.desatRedTint = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "desatRedTint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "desatGreenTint" }) {
            parameters.desatGreenTint = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "desatGreenTint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "desatBlueTint" }) {
            parameters.desatBlueTint = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "desatBlueTint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "blurStrength" }) {
            parameters.blurStrength = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "blurStrength"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "blurType" }) {
            parameters.blurType = Jelly_BlurTypes(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "blurType"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resizeImage" }) {
            parameters.resizeImage = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "resizeImage"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resizeLongestSideTo" }) {
            parameters.resizeLongestSideTo = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "filterImage", name: "resizeLongestSideTo"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"filter": "sepia",
			"sepiaIntensity": "0.3",
			"pixellateAmount": "12.0",
			"desatRedTint": "0.0",
			"desatGreenTint": "0.0",
			"desatBlueTint": "0.0",
			"blurStrength": "0.4",
			"blurType": "Box",
			"image": "[ShortcutInput]",
			"resizeImage": "true",
			"resizeLongestSideTo": "0",

        ]
    }
}