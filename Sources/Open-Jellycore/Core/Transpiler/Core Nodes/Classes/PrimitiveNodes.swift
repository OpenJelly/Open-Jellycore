//
//  PrimitiveNodes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

/// This structure is used to construct primitive nodes and is mostly for convenience of initializing primitives
struct PrimitiveFactory {
    /// A function that derives a primitive node from a given `TreeSitterNode`.
    /// - Parameters:
    ///   - node: The `TreeSitterNode` to convert into a primitive node
    ///   - content: The content of `node` that is retrieved from its parent's content
    /// - Returns: Possibly returns a `CorePrimitiveNode` if the given `node` is capable of being converted into one.
    static func derivePrimitive(node: TreeSitterNode, content: String) -> CorePrimitiveNode? {
        let sString = node.string ?? "No sString"
        if node.type == CoreNodeType.identifier.rawValue {
            return IdentifierNode(sString: sString, content: content, rawValue: node)
        } else if node.type == CoreNodeType.number.rawValue {
            return NumberNode(sString: sString, content: content, rawValue: node)
        } else if node.type == CoreNodeType.array.rawValue {
            return ArrayNode(sString: sString, content: content, rawValue: node)
        } else if node.type == CoreNodeType.string.rawValue || node.type ==  CoreNodeType.multiString.rawValue {
            return StringNode(sString: sString, content: content, rawValue: node)
        }
        return nil
    }
}

/// A node that represents an identifier primitive. Identifier primitives are nodes such as variable names.
final class IdentifierNode: CoreNode, CorePrimitiveNode {
    /// A variable property node such as .as(), .get(), .key()
    final class VariablePropertyNode: CoreNode, CorePrimitiveNode {
        var type: CoreNodeType
        var sString: String
        var content: String
        var rawValue: TreeSitterNode
        
        /// Initializes a Variable Property  node.
        /// - Parameters:
        ///   - sString: The TreeSitter String representation of the `rawValue` node.
        ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
        ///   - rawValue: The raw TreeSitter node that this node wraps.
        init(sString: String, content: String, rawValue: TreeSitterNode) {
            self.type = .variableProperty
            self.sString = sString
            self.content = content
            self.rawValue = rawValue
        }
        
        /// Retrieves the type of property.
        /// - Returns: The property type, if available. If not available `nil` is returned
        func getType() -> String? {
            if let node = rawValue.getChild(by: "type") {
                return rawValue.getContents(of: node, in: content)
            }
            return nil
        }
        
        /// Retrieves the value of the property
        /// - Returns: The value of the property if available. If not available `nil` is returned
        func getValue() -> String? {
            if let node = rawValue.getChild(by: "value") {
                return rawValue.getContents(of: node, in: content)
            }
            return nil
        }
    }
    
    var type: CoreNodeType
    var sString: String
    var content: String
    var originalContent: String
    var rawValue: TreeSitterNode
    
    var aggrandizements: [Aggrandizement] = []

    /// Initializes a Variable node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .identifier
        self.sString = sString
        self.content = content
        self.originalContent = content
        self.rawValue = rawValue
        
        self.collectValues()
        
        if let results = getContentField() {
            self.content = results.content
        }
        
    }
    
    /// Retrieves the identifier content. This would be the variable's name
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String). If there is no content this is returned as nil.
    func getContentField() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "content") {
            let contents = rawValue.getContents(of: node, in: originalContent)
            return (node, contents)
        }
        return nil
    }
    
    /// Collects all of the properties that follow the identifier content.
    func collectValues() {
        for child in rawValue.getChildren().filter({filterChildren($0)}) {
            let childContent = rawValue.getContents(of: child, in: originalContent)
            let propertyNode = VariablePropertyNode(sString: child.string ?? "No sString", content: childContent, rawValue: child)
            
            guard let type = propertyNode.getType() else {
                ErrorReporter.shared.reportError(error: .generic(description: "Invalid Identifier Property. Can not find the type of the property.", recoveryStrategy: "Make sure you are using a valid identifier property. Valid properties are 'get', 'as' and 'key'.", level: .error), node: propertyNode)

                continue
            }
            if type == "as" {
                guard let value = propertyNode.getValue() else {
                    ErrorReporter.shared.reportError(error: .generic(description: "Invalid Identifier Property Value", recoveryStrategy: "Make sure you have included a value in the identifier 'as' property.", level: .error), node: propertyNode)
                    continue
                }
                if let typeCoercion = TypeCoercion(value: value) {
                    aggrandizements.append(Aggrandizement.as(typeCast: typeCoercion))
                } else {
                    ErrorReporter.shared.reportError(error: .invalidTypeCoercion(type: value), node: propertyNode)
                }
            } else if type == "get" {
                guard let value = propertyNode.getValue() else {
                    ErrorReporter.shared.reportError(error: .generic(description: "Invalid Identifier Property Value", recoveryStrategy: "Make sure you have included a value in the identifier 'get' property.", level: .error), node: propertyNode)
                    continue
                }
                
                aggrandizements.append(Aggrandizement.get(property: value))
            } else if type == "key" {
                guard let value = propertyNode.getValue() else {
                    ErrorReporter.shared.reportError(error: .generic(description: "Invalid Identifier Property Value", recoveryStrategy: "Make sure you have included a value in the identifier 'key' property.", level: .error), node: propertyNode)
                    continue
                }
                
                aggrandizements.append(Aggrandizement.key(key: value))
            }
        }
    }
    
    /// Filters the identifier node's children into only variable property children. Used in ``IdentifierNode/collectValues``
    /// - Parameter node: The node that we are checking on
    /// - Returns: A boolean which is true if the node type is variable property.
    private func filterChildren(_ node: TreeSitterNode) -> Bool {
        return node.type == CoreNodeType.variableProperty.rawValue
    }
}

/// A node that represents a number primitive.
final class NumberNode: CoreNode, CorePrimitiveNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    /// Initializes a Numer  node.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .identifier
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    /// Retrieves the number value for the node. If there is no value 0 is returned.
    /// - Returns: The double value for the number.
    func getValue() -> Double? {
        // TODO: Error Handling
        return Double(content)
    }
}

/// A node that represents an array primitive. Internal values can be any primitive nodes.
final class ArrayNode: CoreNode, CorePrimitiveNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var values: [any CorePrimitiveNode] = []
    
    /// Initializes an Array node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .array
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        self.collectValues()
    }
    
    /// Collects all of the internal array values using the named children of `rawValue`.
    func collectValues() {
        for child in rawValue.getNamedChildren() {
            let contents = rawValue.getContents(of: child, in: content)
            if let primitive = PrimitiveFactory.derivePrimitive(node: child, content: contents) {
                values.append(primitive)
            }
        }
    }
}

/// A node that represents a string primitive. This is one of the most complex primitive nodes because it needs to deal with string interpolation.
final class StringNode: CoreNode, CorePrimitiveNode {
    final class InterpolationNode: CoreNode, CorePrimitiveNode {
        var type: CoreNodeType
        var sString: String
        var content: String
        var originalContent: String
        var rawValue: TreeSitterNode
        
        var identifierNode: IdentifierNode?
        
        init(sString: String, content: String, rawValue: TreeSitterNode) {
            self.type = .stringInterpolation
            self.sString = sString
            self.content = content
            self.originalContent = content
            self.rawValue = rawValue
            
            if let results = getIdentifier() {
                self.content = results.content
                self.identifierNode = IdentifierNode(sString: results.node.string ?? "No sString", content: results.content, rawValue: results.node)
            } else {
                ErrorReporter.shared.reportError(error: .generic(description: "Empty Interpolation", recoveryStrategy: "Interpolation can not be empty, please add an identifier", level: .error), node: self)
            }
        }
        
        
        func getIdentifier() -> (content: String, node: TreeSitterNode)? {
            if let node = rawValue.getChild(by: "identifier") {
                return (rawValue.getContents(of: node, in: originalContent), node)
            }
            return nil
        }

    }
    
    final class InternalNode {
        var type: InternalNodeType
        var node: TreeSitterNode
        var localRange: Range<Int>
        var content: String

        
        init(type: InternalNodeType, node: TreeSitterNode, localRange: Range<Int>, content: String) {
            self.type = type
            self.node = node
            self.localRange = localRange
            self.content = content
        }
    }
    
    enum InternalNodeType {
        case text
        case interpolation
    }
    
    var type: CoreNodeType
    var sString: String
    var originalContent: String
    var content: String
    var rawValue: TreeSitterNode
    
    var internalNodes: [InternalNode] = []
    
    /// Initializes a String node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .string
        self.sString = sString
        self.originalContent = content
        self.content = content
        self.rawValue = rawValue
        
        self.collectValues()
        self.trimContent()
    }
    
    /// Remove surrounding quotes from the content of a string.
    private func trimContent() {
        if content.hasPrefix("\"") {
            content.removeFirst()
        }
        if content.hasSuffix("\"") {
            content.removeLast()
        }
    }
    
    /// Collect all of the interpolation within the string. This function walks through the children of the original node and reconstructs a new content variable based on the internal nodes.
    private func collectValues() {
        let rawValueStartByte = rawValue.startByte
        let rawValueEndByte = rawValue.endByte
        var tempContent = ""
        for (offset, child) in rawValue.getChildren().enumerated() {
            let contents = rawValue.getContents(of: child, in: content)
            tempContent += contents
            
            let fieldName = rawValue.getFieldNameForChild(index: offset)
            let adjustedStartByte = rawValueStartByte + (child.startByte - rawValueStartByte) // This will be positive
            let adjustedEndByte = rawValueEndByte + (child.endByte - rawValueEndByte) // This will be negative
            
            let range: Range<Int> = adjustedStartByte ..< adjustedEndByte

            if fieldName == "text" {
                internalNodes.append(InternalNode(type: .text, node: child, localRange: range, content: contents))
            } else if fieldName == "interpolation" {
                internalNodes.append(InternalNode(type: .interpolation, node: child, localRange: range, content: contents))
            }
        }
        self.content = tempContent
    }
}

// TODO: Refactor this out and make compiler nodes be generated in an analysis step where the source code is altered to better fit. Or add the ability to re-parse small strings when needed.
/// A primitive node that is inserted by the compiler. This is never parsed from user input and only inserted by the compiler when needed.
final class CompilerInsertedNode: CoreNode, CorePrimitiveNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    /// An initializer that has access to all of the internal variables of `CompilerInsertedNode`. Allows for control over how the rest of the compiler sees this node and how it is treated.
    /// - Parameters:
    ///   - type: The type of node this should be treated as
    ///   - sString: The sString to display for debugging
    ///   - content: The content of the node
    ///   - rawValue: The node raw value. Usually the parent node is inserted as `TreeSitterNode`s can not be manually created.
    init(type: CoreNodeType, sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = type
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
}
