//
//  SnapshotMapParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SnapshotMapParameter: ParameterProtocol, Codable {
	var location: ShortcutsPlacemark?
	var mapType: Jelly_MapType?
	var style: Jelly_UserInterfaceStyle?
	var pointsOfInterest: Jelly_MapPointsOfInterest?
	var latitude: ShortcutsQuantity?
	var width: JellyDouble?
	var height: JellyDouble?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SnapshotMapParameter()

        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapType" }) {
            parameters.mapType = Jelly_MapType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "mapType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "style" }) {
            parameters.style = Jelly_UserInterfaceStyle(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "style"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pointsOfInterest" }) {
            parameters.pointsOfInterest = Jelly_MapPointsOfInterest(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "pointsOfInterest"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "latitude" }) {
            parameters.latitude = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "latitude"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "width" }) {
            parameters.width = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "width"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "height" }) {
            parameters.height = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "snapshotMap", name: "height"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"location": "Placemark(addressDictionary: AddressDictionary(City: \"\", Country: \"\", CountryCode: \"\", FormattedAddressLines: [\"\", \"\"], Name: \"\", State: \"\", Street: \"\"), SubAdministrativeArea: \"\", SubThoroughfare: \"\", Thoroughfare: \"\", ZIP: \"\"), location: Location(altitude: 0, course: 1, horizontalAccuracy: 0.0, latitude: 0, longitude: 0, speed: 1, timestamp: 2022-02-22t22:22:22Z, verticalAccuracy: 1), region: Region(center: Center(latitude: 0.0, longitude: 0.0), identifier: \"\", radius: 100.0))",
			"mapType": "standard",
			"style": "light",
			"pointsOfInterest": "includeAll",
			"latitude": "42 miles",
			"width": "20",
			"height": "100",

        ]
    }
}
