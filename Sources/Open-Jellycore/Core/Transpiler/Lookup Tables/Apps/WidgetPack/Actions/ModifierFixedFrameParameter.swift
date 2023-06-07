//
//  ModifierFixedFrameParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ModifierFixedFrameParameter: ParameterProtocol, Codable {
	var fixedFrameWidth: JellyDouble?
	var fixedFrameHeight: JellyDouble?
	var fixedFrameAlignment: Jelly_Alignment?
	var view: Jelly_View?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ModifierFixedFrameParameter()

        if let value = call.first(where: { node in return node.slotName == "fixedFrameWidth" }) {
            parameters.fixedFrameWidth = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedFrame", name: "fixedFrameWidth"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedFrameHeight" }) {
            parameters.fixedFrameHeight = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedFrame", name: "fixedFrameHeight"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "fixedFrameAlignment" }) {
            parameters.fixedFrameAlignment = Jelly_Alignment(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedFrame", name: "fixedFrameAlignment"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "modifierFixedFrame", name: "view"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"fixedFrameWidth": "140",
			"fixedFrameHeight": "140",
			"fixedFrameAlignment": "Alignment(identifier: \"Alignment\", displayString: \"Alignment\")",
			"view": "View(identifier: \"View1\", displayString: \"View One\")",

        ]
    }
}
