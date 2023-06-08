//
//  GetSymbolNameParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetSymbolNameParameter: ParameterProtocol, Codable {
	var category: JellyString?
	var symbolNameType: Jelly_SymbolNameType?
	var name: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetSymbolNameParameter()

        if let value = call.first(where: { node in return node.slotName == "category" }) {
            parameters.category = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getSymbolName", name: "category"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "symbolNameType" }) {
            parameters.symbolNameType = Jelly_SymbolNameType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getSymbolName", name: "symbolNameType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getSymbolName", name: "name"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"category": "Media",
			"symbolNameType": "All",
			"name": "play",

        ]
    }
}