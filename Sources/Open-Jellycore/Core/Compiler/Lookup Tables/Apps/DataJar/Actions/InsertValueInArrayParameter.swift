//
//  InsertValueInArrayParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct InsertValueInArrayParameter: ParameterProtocol, Codable {
	var values: JellyArray<JellyVariableReference>?
	var keyPath: JellyString?
	var insertionPoint: Jelly_ArrayValueInsertionPoint?
	var index: JellyInteger?
	var valueConversionMode: Jelly_ValueConversionMode?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = InsertValueInArrayParameter()

        if let value = call.first(where: { node in return node.slotName == "values" }) {
            parameters.values = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "insertValueInArray", name: "values"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "keyPath" }) {
            parameters.keyPath = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "insertValueInArray", name: "keyPath"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "insertionPoint" }) {
            parameters.insertionPoint = Jelly_ArrayValueInsertionPoint(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "insertValueInArray", name: "insertionPoint"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "index" }) {
            parameters.index = JellyInteger(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "insertValueInArray", name: "index"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "valueConversionMode" }) {
            parameters.valueConversionMode = Jelly_ValueConversionMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "insertValueInArray", name: "valueConversionMode"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"values": "newFile",
			"keyPath": "jsonFiles/",
			"insertionPoint": "index",
			"index": "2",
			"valueConversionMode": "file",

        ]
    }
}