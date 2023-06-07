//
//  ViewMapParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ViewMapParameter: ParameterProtocol, Codable {
	var location: ShortcutsPlacemark?
	var mapTitle: JellyString?
	var showPin: JellyBoolean?
	var pinLabel: JellyString?
	var mapZoom: JellyDouble?
	var showBuildings: JellyBoolean?
	var showCompass: JellyBoolean?
	var showZoomControls: JellyBoolean?
	var showScale: JellyBoolean?
	var showTraffic: JellyBoolean?
	var isInteractive: JellyBoolean?
	var isScrollable: JellyBoolean?
	var isZoomable: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ViewMapParameter()

        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapTitle" }) {
            parameters.mapTitle = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "mapTitle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "showPin" }) {
            parameters.showPin = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "showPin"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "pinLabel" }) {
            parameters.pinLabel = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "pinLabel"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "mapZoom" }) {
            parameters.mapZoom = JellyDouble(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "mapZoom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "showBuildings" }) {
            parameters.showBuildings = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "showBuildings"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "showCompass" }) {
            parameters.showCompass = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "showCompass"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "showZoomControls" }) {
            parameters.showZoomControls = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "showZoomControls"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "showScale" }) {
            parameters.showScale = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "showScale"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "showTraffic" }) {
            parameters.showTraffic = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "showTraffic"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isInteractive" }) {
            parameters.isInteractive = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "isInteractive"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isScrollable" }) {
            parameters.isScrollable = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "isScrollable"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isZoomable" }) {
            parameters.isZoomable = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "viewMap", name: "isZoomable"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"location": "Placemark(addressDictionary: AddressDictionary(City: \"\", Country: \"\", CountryCode: \"\", FormattedAddressLines: [\"\", \"\"], Name: \"\", State: \"\", Street: \"\"), SubAdministrativeArea: \"\", SubThoroughfare: \"\", Thoroughfare: \"\", ZIP: \"\"), location: Location(altitude: 0, course: 1, horizontalAccuracy: 0.0, latitude: 0, longitude: 0, speed: 1, timestamp: 2022-02-22t22:22:22Z, verticalAccuracy: 1), region: Region(center: Center(latitude: 0.0, longitude: 0.0), identifier: \"\", radius: 100.0))",
			"mapTitle": "\"My Map\"",
			"showPin": "true",
			"pinLabel": "\"My Pin\"",
			"mapZoom": "0.3",
			"showBuildings": "true",
			"showCompass": "true",
			"showZoomControls": "true",
			"showScale": "true",
			"showTraffic": "true",
			"isInteractive": "true",
			"isScrollable": "true",
			"isZoomable": "true",

        ]
    }
}
