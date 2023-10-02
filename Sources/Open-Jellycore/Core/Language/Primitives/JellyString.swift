//
//  JellyString.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// A representation of a String that supports converting interpolated values into Shortcuts attachments.
struct JellyString: JellyPrimitiveType {
    typealias T = String
    
    /// The encoding keys necessary for the JellyString to be properly encoded for Shortcuts.
    enum EncodingKeys: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
    }

    /// The value for a ``JellyString`` which is just a Swift boolean.
    var value: String
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyString/value``.
    var variable: JellyVariableReference? = nil
    /// The String's attachments keyed by their range in format `{lowerBound, 1}`.
    var attachmentsByRange: [String: JellyVariableReference] = [:]

    /// An initializer that attempts to convert a string into a Jelly string.
    /// If this is unsuccessful, the function will throw an error.
    /// - Parameter value: The string value to attempt to convert to ``JellyString/T``.
    init(_ value: T) {
        self.value = value
    }
    
    /// This initializer creates a ``JellyString`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyString``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyString``.
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        if let value = value as? FunctionCallParameterItem {
            self.init(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            self.init(value.content)
        }
    }
    
    /// This initializer creates a ``JellyString`` type taking in a ``CorePrimitiveNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyString``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyString``.
    init(_ value: CorePrimitiveNode, scopedVariables: [Variable]) {
        if let stringNode = value as? StringNode {
            self.init(stringNode.content)
            createAttachments(stringNode, scopedVariables: scopedVariables)
        } else {
            self.init(value.content)
        }
    }
    
    /// Creates a string attachment. String attachments are shortcuts interpolation values that use the object Unicode Character to hold a spot in the string. This function loops through the internal nodes and creates a new attachment for each of the internal nodes that is an interpolation node.
    /// - Parameters:
    ///   - value: The String Node to create attachments for.
    ///   - scopedVariables: The scoped variables that are applicable to this ``JellyString`` and the interpolations inside of it.
    mutating func createAttachments(_ value: StringNode, scopedVariables: [Variable]) {
        for child in value.internalNodes.filter({internalNodeFilter($0)}) {
            let interpolationNode = StringNode.InterpolationNode(sString: child.node.string ?? "No sString", content: child.content, rawValue: child.node)
            let key = "{\(child.localRange.lowerBound), 1}"
            if var variableReference = JellyVariableReference(interpolationNode: interpolationNode, scopedVariables: scopedVariables) {
                variableReference.needsValueKey = false
                variableReference.needsSerialization = false
                
                attachmentsByRange.merge([key: variableReference]) { first, _ in
                    return first
                }
                
                self.value = self.value.replacingOccurrences(of: "\(child.content)", with: "￼")
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: interpolationNode.identifierNode?.content ?? interpolationNode.content), node: interpolationNode)
            }
        }
    }
    
    /// A filter that checks for a node to be an interpolation node
    /// - Parameter node: The internal node to check.
    /// - Returns: Returns ture if the node's type is ``StringNode/InternalNode.interpolation``
    private func internalNodeFilter(_ node: StringNode.InternalNode) -> Bool {
        return node.type == .interpolation
    }

    /// Encodes the ``JellyString`` to the given `encoder`.
    /// - Parameter encoder: the encoder to encode into.
    func encode(to encoder: Encoder) throws {
        if attachmentsByRange.isEmpty {
            var container = encoder.singleValueContainer()
            try container.encode(value)
        } else {
            var container = encoder.container(keyedBy: EncodingKeys.self)

            let outerDictionary: [String: QuantumValue] = [
                "attachmentsByRange": QuantumValue(attachmentsByRange),
                "string": QuantumValue(value)
            ]
            
            try container.encode(outerDictionary, forKey: .value)
            try container.encode("WFTextTokenString", forKey: .serializationType)
        }
    }
}
