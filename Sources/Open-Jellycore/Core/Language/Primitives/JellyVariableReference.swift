//
//  JellyVariableReference.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

import Foundation

struct JellyVariableReference: JellyAny, Codable {
    var name: String
    var uuid: String

    var aggrandizements: [Aggrandizement] = []
    var needsValueKey: Bool = true
    var needsSerialization: Bool = true
    var variableType: String = "Variable"
    var unableToInitialize: Bool = false
    
    private enum EncodingKey: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
        case type = "Type"
        case variableName = "VariableName"
        case aggrandizements = "Aggrandizements"
        
        case outputName = "OutputName"
        case outputUUID = "OutputUUID"
    }
    
    init(_ value: Variable) {
        self.name = value.name
        self.uuid = value.uuid
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.name = ""
        self.uuid = ""
    }
            
//    init(_ variableName: String, uuid: String, node: CoreNode, variables: [Variable]) {
//        self.name = variableName
//        self.uuid = uuid
//        // TODO: Re-setup variable type
////        // MARK: Remove Aggrandizements
////        var nameComponents = name.components(separatedBy: ".")
////        self.name = nameComponents.removeFirst()
////
////        if nameComponents.count > 0 {
////            parseAggrandizements(individualAggrandizement: nameComponents, textPosition: textPosition)
////        }
////
////        // MARK: Check for a valid variable
//        if let variable = variables.first(where: { variable in
//            return name == variable.name
//        }) {
//            self.uuid = variable.uuid
//
//            if variableName == "ShortcutInput" {
//                variableType = "ExtensionInput"
//            } else if variableName == "Clipboard" {
//                variableType = "Clipboard"
//            } else if variableName == "CurrentDate" {
//                variableType = "CurrentDate"
//            } else if variableName == "Ask" {
//                variableType = "Ask"
//            } else if variableName == "DeviceDetails" {
//                variableType = "DeviceDetails"
//            } else if variable.valueType == .magicVariable {
//                variableType = "ActionOutput"
//            }
//        } else {
//            ErrorHandler.shared.reportError(error: .variableDoesNotExist(variable: variableName), node: node)
//            unableToInitialize = true
//        }
//    }
//
//    mutating func parseAggrandizements(individualAggrandizement: [String], textPosition: TextPosition) {
//        for aggrandizement in individualAggrandizement {
//            if aggrandizement.starts(with: "as") {
//                var value = aggrandizement.replacingOccurrences(of: "as(", with: "")
//                value.removeLast()
//                if let typeCoercion = TypeCoercion(value: value) {
//                    aggrandizements.append(Aggrandizement.as(typeCast: typeCoercion))
//                } else {
//                    ErrorReporter.shared.report(error: .syntaxError(error: "Invalid Type Coercion \(value)"), textPosition: textPosition)
//                }
//            } else if aggrandizement.starts(with: "get") {
//                var value = aggrandizement.replacingOccurrences(of: "as(", with: "")
//                value.removeLast()
//                aggrandizements.append(Aggrandizement.get(property: value))
//            } else if aggrandizement.starts(with: "key") {
//                var value = aggrandizement.replacingOccurrences(of: "as(", with: "")
//                value.removeLast()
//                aggrandizements.append(Aggrandizement.key(key: value))
//            }
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: EncodingKey.self)
//
//        if needsValueKey {
//            if variableType == "ActionOutput" {
//                let variableDictioanry: [String: QuantumValue] = [
//                    EncodingKey.type.rawValue : QuantumValue(variableType),
//                    EncodingKey.outputName.rawValue : QuantumValue(name),
//                    EncodingKey.outputUUID.rawValue: QuantumValue(uuid),
//                    EncodingKey.aggrandizements.rawValue : QuantumValue(aggrandizements)
//                ]
//
//                try container.encode(variableDictioanry, forKey: .value)
//            } else {
//                let variableDictioanry: [String: QuantumValue] = [
//                    EncodingKey.type.rawValue : QuantumValue(variableType),
//                    EncodingKey.variableName.rawValue : QuantumValue(name),
//                    EncodingKey.aggrandizements.rawValue : QuantumValue(aggrandizements)
//                ]
//
//                try container.encode(variableDictioanry, forKey: .value)
//            }
//        } else {
//            if variableType == "ActionOutput" {
//                try container.encode(name, forKey: .outputName)
//                try container.encode(uuid, forKey: .outputUUID)
//            } else {
//                try container.encode(name, forKey: .variableName)
//            }
//
//            try container.encode(variableType, forKey: .type)
//            try container.encode(aggrandizements, forKey: .aggrandizements)
//        }
//
//        if needsSerialization {
//            try container.encode("WFTextTokenAttachment", forKey: .serializationType)
//        }
//    }
}
