//
//  StockQuoteParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct StockQuoteParameter: ParameterProtocol, Codable {
	var StockSymbol: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = StockQuoteParameter()

        if let value = call.first(where: { node in return node.slotName == "symbol" }) {
            parameters.StockSymbol = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "stockQuote", name: "symbol"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"symbol": "$AAPL",

        ]
    }
}