//
//  JellyString.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct JellyString: JellyPrimitiveType {
    typealias T = String
    
    enum EncodingKeys: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
    }

    var value: String
    var variable: JellyVariableReference? = nil
    var attachmentsByRange: [String: JellyVariableReference] = [:]

    init(_ value: T) {
        self.value = value
    }
    
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        if let value = value as? FunctionCallParameterItem {
            self.init(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            self.init(value.content)
        }
    }
    
    init(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable]) {
        if let stringNode = parameterItem.item as? StringNode {
            self.init(stringNode.content)
            createAttachments(stringNode, scopedVariables: scopedVariables)
        } else {
            self.init(parameterItem.content)
        }
    }
    
    mutating func createAttachments(_ value: StringNode, scopedVariables: [Variable]) {
        for child in value.internalNodes.filter({internalNodeFilter($0)}) {
            let interpolationNode = StringNode.InterpolationNode(sString: child.node.string ?? "No sString", content: child.content, rawValue: child.node)
            let key = "{\(child.localRange.lowerBound), 1}"
            var variableReference = JellyVariableReference(interpolationNode: interpolationNode, scopedVariables: scopedVariables)
            variableReference.needsValueKey = false
            variableReference.needsSerialization = false
            
            attachmentsByRange.merge([key: variableReference]) { first, _ in
                return first
            }
            
            self.value = self.value.replacingOccurrences(of: "\(child.content)", with: "￼")
        }
    }
    
    
    private func internalNodeFilter(_ node: StringNode.InternalNode) -> Bool {
        return node.type == .interpolation
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)

        let outerDictionary: [String: QuantumValue] = [
            "attachmentsByRange": QuantumValue(attachmentsByRange),
            "string": QuantumValue(value)
        ]
        
        try container.encode(outerDictionary, forKey: .value)
        try container.encode("WFTextTokenString", forKey: .serializationType)
    }
}
