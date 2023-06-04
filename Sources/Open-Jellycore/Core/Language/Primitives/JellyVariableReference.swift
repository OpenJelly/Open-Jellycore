//
//  JellyVariableReference.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

import Foundation

struct JellyVariableReference: JellyAny, Codable {
    enum VariableType: String, Codable {
        case variable = "Variable"
        case shortcutInput = "ExtensionInput"
        case clipboard = "Clipboard"
        case currentDate = "CurrentDate"
        case ask = "Ask"
        case deviceDetails = "DeviceDetails"
        case magicVariable = "ActionOutput"
        
        init?(jellyValue: String) {
            switch jellyValue {
            case "ShortcutInput":
                self = .shortcutInput
            case "Clipboard":
                self = .clipboard
            case "CurrentDate":
                self = .currentDate
            case "Ask":
                self = .ask
            case "DeviceDetails":
                self = .deviceDetails
            default:
                self = .variable
            }
        }
    }
    
    var name: String
    var uuid: String

    var aggrandizements: [Aggrandizement] = []
    var needsValueKey: Bool = true
    var needsSerialization: Bool = true
    var variableType: VariableType = .variable
    
    private enum EncodingKey: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
        case type = "Type"
        case variableName = "VariableName"
        case aggrandizements = "Aggrandizements"
        
        case outputName = "OutputName"
        case outputUUID = "OutputUUID"
    }
    
    init(_ value: Variable, scopedVariables: [Variable]) {
        self.name = value.name
        self.uuid = value.uuid
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.name = value.content
        self.uuid = ""
        
        if let variable = scopedVariables.first(where: { variableNameFilter(variable: $0, name: name) }) {
            self.name = variable.name
            self.uuid = variable.uuid
            
            if variable.valueType == .magicVariable {
                variableType = .magicVariable
            }
        } else if let globalVariable = Transpiler.globalVariables.first(where: { variableNameFilter(variable: $0, name: name) }) {
            if let type = VariableType(jellyValue: globalVariable.name) {
                self.variableType = type
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: self.name), node: value)
                return nil
            }
        } else {
            ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: self.name), node: value)
            return nil
        }
    }
    
    init?(identifierNode: IdentifierNode, scopedVariables: [Variable]) {
        self.name = identifierNode.content
        self.uuid = ""
        
        if let variable = scopedVariables.first(where: { variableNameFilter(variable: $0, name: name) }) {
            self.name = variable.name
            self.uuid = variable.uuid
            self.aggrandizements = identifierNode.aggrandizements
            
            if variable.valueType == .magicVariable {
                variableType = .magicVariable
            }
        } else if let globalVariable = Transpiler.globalVariables.first(where: { variableNameFilter(variable: $0, name: name) }) {
            if let type = VariableType(jellyValue: globalVariable.name) {
                self.variableType = type
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: self.name), node: identifierNode)
                return nil
            }
        } else {
            ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: self.name), node: identifierNode)
            return nil
        }
    }

    
    init?(interpolationNode: StringNode.InterpolationNode, scopedVariables: [Variable]) {
        self.name = ""
        self.uuid = ""
        let name = interpolationNode.identifierNode?.content ?? interpolationNode.content

        if let variable = scopedVariables.first(where: { variableNameFilter(variable: $0, name: name) }) {
            self.name = variable.name
            self.uuid = variable.uuid
            self.aggrandizements = interpolationNode.identifierNode?.aggrandizements ?? []
            
            if variable.valueType == .magicVariable {
                variableType = .magicVariable
            }
        } else if let globalVariable = Transpiler.globalVariables.first(where: { variableNameFilter(variable: $0, name: name) }) {
            if let type = VariableType(jellyValue: globalVariable.name) {
                self.variableType = type
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: self.name), node: interpolationNode)
                return nil
            }
        } else {
            ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: self.name), node: interpolationNode)
            return nil
        }
    }
    
    private func variableNameFilter(variable: Variable, name: String) -> Bool {
        return variable.name == name
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKey.self)

        if needsValueKey {
            if variableType == .magicVariable {
                let variableDictioanry: [String: QuantumValue] = [
                    EncodingKey.type.rawValue : QuantumValue(variableType),
                    EncodingKey.outputName.rawValue : QuantumValue(name),
                    EncodingKey.outputUUID.rawValue: QuantumValue(uuid),
                    EncodingKey.aggrandizements.rawValue : QuantumValue(aggrandizements)
                ]

                try container.encode(variableDictioanry, forKey: .value)
            } else {
                let variableDictioanry: [String: QuantumValue] = [
                    EncodingKey.type.rawValue : QuantumValue(variableType),
                    EncodingKey.variableName.rawValue : QuantumValue(name),
                    EncodingKey.aggrandizements.rawValue : QuantumValue(aggrandizements)
                ]

                try container.encode(variableDictioanry, forKey: .value)
            }
        } else {
            if variableType == .magicVariable {
                try container.encode(name, forKey: .outputName)
                try container.encode(uuid, forKey: .outputUUID)
            } else {
                try container.encode(name, forKey: .variableName)
            }

            try container.encode(variableType, forKey: .type)
            try container.encode(aggrandizements, forKey: .aggrandizements)
        }

        if needsSerialization {
            try container.encode("WFTextTokenAttachment", forKey: .serializationType)
        }
    }
}
