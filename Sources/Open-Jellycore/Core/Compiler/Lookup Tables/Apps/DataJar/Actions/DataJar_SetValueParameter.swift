//
//  DataJar_SetValueParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DataJar_SetValueParameter: ParameterProtocol, Codable {
	var keyPath: JellyString?
	var values: JellyArray<JellyVariableReference>?
	var valueConversionMode: Jelly_ValueConversionMode?
	var overwriteStrategy: Jelly_OverwriteStrategy?
	var filename: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DataJar_SetValueParameter()

        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "values" }) {
            parameters.values = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "values"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "valueConversionMode" }) {
            parameters.valueConversionMode = Jelly_ValueConversionMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "valueConversionMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "overwriteStrategy" }) {
            parameters.overwriteStrategy = Jelly_OverwriteStrategy(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "overwriteStrategy"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "filename" }) {
            parameters.filename = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "setValue", name: "filename"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"keyPath": "jsonFiles/",
			"values": "newFile",
			"valueConversionMode": "file",
			"overwriteStrategy": "alwaysAllow",
			"filename": "New File",

        ]
    }
}
