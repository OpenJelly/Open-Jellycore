//
//  SelectPhotoParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SelectPhotoParameter: ParameterProtocol, Codable {
	var WFPhotoPickerTypes: JellyArray<Jelly_WFPhotoPickerTypes>?
	var WFSelectMultiplePhotos: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SelectPhotoParameter()

        if let value = call.first(where: { node in return node.slotName == "types" }) {
            parameters.WFPhotoPickerTypes = JellyArray<Jelly_WFPhotoPickerTypes>(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "selectPhoto", name: "types"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "multiple" }) {
            parameters.WFSelectMultiplePhotos = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "selectPhoto", name: "multiple"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"types": "[Images, Videos]",
			"multiple": "true",

        ]
    }
}
