//
//  GetForecastParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetForecastParameter: ParameterProtocol, Codable {
	var type: Jelly_WFWeatherForecastType?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetForecastParameter()

        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_WFWeatherForecastType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getForecast", name: "type"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"type": "Hourly",

        ]
    }
}