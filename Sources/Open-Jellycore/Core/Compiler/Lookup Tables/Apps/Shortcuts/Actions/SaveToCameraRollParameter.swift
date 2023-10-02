//
//  SaveToCameraRollParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SaveToCameraRollParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFCameraRollSelectedGroup: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SaveToCameraRollParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" })?.item {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveToCameraRoll", name: "image"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "album" }) {
            parameters.WFCameraRollSelectedGroup = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "saveToCameraRoll", name: "album"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "avatar",
			"album": "a-Profiles",

        ]
    }
}
