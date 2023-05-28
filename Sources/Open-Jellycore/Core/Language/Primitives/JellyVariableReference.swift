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
    
    init(_ value: Variable, scopedVariables: [Variable]) {
        self.name = value.name
        self.uuid = value.uuid
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.name = ""
        self.uuid = ""
        
        if let variable = scopedVariables.first(where: {variableNameFilter(variable: $0, name: name)}) {
            self.name = variable.name
            self.uuid = variable.uuid
        } else {
            return nil
        }
    }
    
    init(interpolationNode: StringNode.InterpolationNode, scopedVariables: [Variable]) {
        self.name = interpolationNode.identifierNode?.content ?? interpolationNode.content
        self.uuid = UUID().uuidString
        self.aggrandizements = interpolationNode.identifierNode?.aggrandizements ?? []
    }
    
    private func variableNameFilter(variable: Variable, name: String) -> Bool {
        return variable.name == name
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKey.self)

        if needsValueKey {
            if variableType == "ActionOutput" {
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
            if variableType == "ActionOutput" {
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
