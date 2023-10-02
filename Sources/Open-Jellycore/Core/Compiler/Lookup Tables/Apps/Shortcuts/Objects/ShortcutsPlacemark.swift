//
//  ShortcutsPlacemark.swift
//  
//
//  Created by Zachary Lineman on 1/2/23.
//

struct ShortcutsPlacemark: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Shortcuts Placemark"
    @CodableIgnored
    var correctType: String = "Placemark"
    @CodableIgnored
    var description: String = "A placemark that represents a location in the world."
    
    var addressDictionary: ShortcutsAddressDictionary?
    var location: ShortcutsLocation?
    var region: ShortcutsRegion?
    
    init(_ value: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = value as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "addressDictionary" }) {
//                self.addressDictionary = ShortcutsAddressDictionary(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "addressDictionary", functionName: "ShortcutsPlacemark"), textPosition: value.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "location" }) {
//                self.location = ShortcutsLocation(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "location", functionName: "ShortcutsPlacemark"), textPosition: value.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "region" }) {
//                self.region = ShortcutsRegion(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "region", functionName: "ShortcutsPlacemark"), textPosition: value.textPosition)
//            }
//        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(addressDictionary, forKey: .addressDictionary)
        try container.encode(location, forKey: .location)
        try container.encode(region, forKey: .region)
    }
}

struct ShortcutsAddressDictionary: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Shortcuts Address Dictionary"
    @CodableIgnored
    var correctType: String = "AddressDictionary"
    @CodableIgnored
    var description: String = "An address dictionary used by Shortcuts Placemarks."
    
    var City: JellyString?
    var Country: JellyString?
    var CountryCode: JellyString?
    var FormattedAddressLines: JellyArray<JellyString>?
    var Name: JellyString?
    var State: JellyString?
    var Street: JellyString?
    var SubAdministrativeArea: JellyString?
    var SubThoroughfare: JellyString?
    var Thoroughfare: JellyString?
    var ZIP: JellyString?
    
    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "City" }) {
//                City = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "City", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "Country" }) {
//                Country = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "Country", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "CountryCode" }) {
//                CountryCode = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "CountryCode", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "FormattedAddressLines" }) {
//                FormattedAddressLines = JellyArray(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "FormattedAddressLines", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "Name" }) {
//                Name = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "Name", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "State" }) {
//                State = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "State", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "Street" }) {
//                Street = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "Street", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "SubAdministrativeArea" }) {
//                SubAdministrativeArea = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "SubAdministrativeArea", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "SubThoroughfare" }) {
//                SubThoroughfare = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "SubThoroughfare", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "Thoroughfare" }) {
//                Thoroughfare = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "Thoroughfare", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//            
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "ZIP" }) {
//                ZIP = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "ZIP", functionName: "ShortcutsPlacemark"), textPosition: node.textPosition)
//            }
//        }
    }
}

struct ShortcutsLocation: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Shortcuts Location"
    @CodableIgnored
    var correctType: String = "Location"
    @CodableIgnored
    var description: String = "A location used by the shortcuts placmark object."
    
    var altitude: JellyDouble?
    var course: JellyInteger?
    var horizontalAccuracy: JellyDouble?
    var latitude: JellyDouble?
    var longitude: JellyDouble?
    var speed: JellyInteger?
    var timestamp: JellyDate?
    var verticalAccuracy: JellyInteger?
    
    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "altitude" }) {
//                altitude = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "altitude", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "course" }) {
//                course = JellyInteger(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "course", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "horizontalAccuracy" }) {
//                horizontalAccuracy = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "horizontalAccuracy", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "horizontalAccuracy" }) {
//                horizontalAccuracy = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "horizontalAccuracy", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "latitude" }) {
//                latitude = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "latitude", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "longitude" }) {
//                longitude = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "longitude", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "speed" }) {
//                speed = JellyInteger(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "speed", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "timestamp" }) {
//                timestamp = JellyDate(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "timestamp", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "verticalAccuracy" }) {
//                verticalAccuracy = JellyInteger(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "verticalAccuracy", functionName: "ShortcutsLocation"), textPosition: node.textPosition)
//            }
//        }
    }
}

struct ShortcutsRegion: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Shortcuts Region"
    @CodableIgnored
    var correctType: String = "Region"
    @CodableIgnored
    var description: String = "A region used by a Shortcuts Placemark object."
    
    var center: ShortcutsCenter?
    var identifier: JellyString?
    var radius: JellyDouble?
    
    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "center" }) {
//                center = ShortcutsCenter(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "center", functionName: "ShortcutsRegion"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                identifier = JellyString(value, childrenNodes: value.childrenNodes, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "ShortcutsRegion"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "radius" }) {
//                radius = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "radius", functionName: "ShortcutsRegion"), textPosition: node.textPosition)
//            }
//        }
    }
}

struct ShortcutsCenter: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Shortcuts Center"
    @CodableIgnored
    var correctType: String = "Center"
    @CodableIgnored
    var description: String = "The center of a Shortcuts Region."
    
    var latitude: JellyDouble?
    var longitude: JellyDouble?

    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "latitude" }) {
//                latitude = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "latitude", functionName: "ShortcutsCenter"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "longitude" }) {
//                longitude = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "longitude", functionName: "ShortcutsCenter"), textPosition: node.textPosition)
//            }
//        }
    }
}
