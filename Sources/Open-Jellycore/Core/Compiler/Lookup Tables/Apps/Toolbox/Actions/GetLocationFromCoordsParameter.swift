//
//  GetLocationFromCoordsParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetLocationFromCoordsParameter: ParameterProtocol, Codable {
	var latitude: JellyDouble?
	var longitude: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetLocationFromCoordsParameter()

        if let value = call.first(where: { node in return node.slotName == "latitude" }) {
            parameters.latitude = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getLocationFromCoords", name: "latitude"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "longitude" }) {
            parameters.longitude = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "getLocationFromCoords", name: "longitude"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"latitude": "0",
			"longitude": "0",

        ]
    }
}
