//
//  SFSymbolParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SFSymbolParameter: ParameterProtocol, Codable {
	var byName: JellyBoolean?
	var name: JellyString?
	var systemImage: Jelly_SFSymbol?
	var resizable: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SFSymbolParameter()

        if let value = call.first(where: { node in return node.slotName == "byName" }) {
            parameters.byName = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sFSymbol", name: "byName"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sFSymbol", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "systemImage" }) {
            parameters.systemImage = Jelly_SFSymbol(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sFSymbol", name: "systemImage"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "resizable" }) {
            parameters.resizable = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "sFSymbol", name: "resizable"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"byName": "false",
			"name": "\"\"",
			"systemImage": "SFSymbol(identifier: \"bolt\", displayString: \"bolt\")",
			"resizable": "true",

        ]
    }
}
