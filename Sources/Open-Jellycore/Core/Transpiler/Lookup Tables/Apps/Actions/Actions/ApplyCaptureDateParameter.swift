//
//  ApplyCaptureDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ApplyCaptureDateParameter: ParameterProtocol, Codable {
	var images: JellyArray<JellyVariableReference>?
	var setModificationDate: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ApplyCaptureDateParameter()

        if let value = call.first(where: { node in return node.slotName == "images" }) {
            parameters.images = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "applyCaptureDate", name: "images"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setModificationDate" }) {
            parameters.setModificationDate = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "applyCaptureDate", name: "setModificationDate"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"images": "[ShortcutInput]",
			"setModificationDate": "true",

        ]
    }
}