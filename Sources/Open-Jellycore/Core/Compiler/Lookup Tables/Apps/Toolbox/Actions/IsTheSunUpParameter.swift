//
//  IsTheSunUpParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct IsTheSunUpParameter: ParameterProtocol, Codable {
	var location: ShortcutsPlacemark?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = IsTheSunUpParameter()

        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "isTheSunUp", name: "location"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"location": "Placemark(addressDictionary: AddressDictionary(City: \"\", Country: \"\", CountryCode: \"\", FormattedAddressLines: [\"\", \"\"], Name: \"\", State: \"\", Street: \"\"), SubAdministrativeArea: \"\", SubThoroughfare: \"\", Thoroughfare: \"\", ZIP: \"\"), location: Location(altitude: 0, course: 1, horizontalAccuracy: 0.0, latitude: 0, longitude: 0, speed: 1, timestamp: 2022-02-22t22:22:22Z, verticalAccuracy: 1), region: Region(center: Center(latitude: 0.0, longitude: 0.0), identifier: \"\", radius: 100.0))",

        ]
    }
}
