//
//  PrimitiveNodes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

struct PrimitiveFactory {
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
        } else if node.type == CoreNodeType.identifier.rawValue {
            return VariableNode(sString: sString, content: content, rawValue: node)
        }
        return nil
    }
}

protocol CorePrimitiveNode {
    var type: CoreNodeType { get }
    var content: String { get }
    var sString: String { get }
    var rawValue: TreeSitterNode { get }
}

final class IdentifierNode: CoreNode, CorePrimitiveNode {
    final class VariablePropertyNode: CoreNode, CorePrimitiveNode {
        var type: CoreNodeType
        var sString: String
        var content: String
        var rawValue: TreeSitterNode
        
        init(sString: String, content: String, rawValue: TreeSitterNode) {
            self.type = .variableProperty
            self.sString = sString
            self.content = content
            self.rawValue = rawValue
        }
        
        func getType() -> String? {
            if let node = rawValue.getChild(by: "type") {
                return rawValue.getContents(of: node, in: content)
            }
            return nil
        }
        
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
        
    func getContentField() -> (content: String, node: TreeSitterNode)? {
        if let node = rawValue.getChild(by: "content") {
            return (rawValue.getContents(of: node, in: originalContent), node)
        }
        return nil
    }
    
    func collectValues() {
        for child in rawValue.getChildren().filter({filterChildren($0)}) {
            let childContent = rawValue.getContents(of: child, in: originalContent)
            let propertyNode = VariablePropertyNode(sString: child.string ?? "No sString", content: childContent, rawValue: child)
            
            guard let type = propertyNode.getType() else {
                ErrorHandler.shared.reportError(error: .generic(description: "Invalid Identifier Property. Can not find the type of the property.", recoveryStrategy: "Make sure you are using a valid identifier property. Valid properties are 'get', 'as' and 'key'.", level: .error), node: propertyNode)

                continue
            }
            if type == "as" {
                guard let value = propertyNode.getValue() else {
                    ErrorHandler.shared.reportError(error: .generic(description: "Invalid Identifier Property Value", recoveryStrategy: "Make sure you have included a value in the identifier 'as' property.", level: .error), node: propertyNode)
                    continue
                }
                if let typeCoercion = TypeCoercion(value: value) {
                    aggrandizements.append(Aggrandizement.as(typeCast: typeCoercion))
                } else {
                    ErrorHandler.shared.reportError(error: .invalidTypeCoercion(type: value), node: propertyNode)
                }
            } else if type == "get" {
                guard let value = propertyNode.getValue() else {
                    ErrorHandler.shared.reportError(error: .generic(description: "Invalid Identifier Property Value", recoveryStrategy: "Make sure you have included a value in the identifier 'get' property.", level: .error), node: propertyNode)
                    continue
                }
                
                aggrandizements.append(Aggrandizement.get(property: value))
            } else if type == "key" {
                guard let value = propertyNode.getValue() else {
                    ErrorHandler.shared.reportError(error: .generic(description: "Invalid Identifier Property Value", recoveryStrategy: "Make sure you have included a value in the identifier 'key' property.", level: .error), node: propertyNode)
                    continue
                }
                
                aggrandizements.append(Aggrandizement.key(key: value))
            }
        }
    }
    
    private func filterChildren(_ node: TreeSitterNode) -> Bool {
        return node.type == CoreNodeType.variableProperty.rawValue
    }
}

final class NumberNode: CoreNode, CorePrimitiveNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .identifier
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    func getValue() -> Int {
        // TODO: Error Handling
        return Int(content) ?? 0
    }
}

final class ArrayNode: CoreNode, CorePrimitiveNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var values: [any CorePrimitiveNode] = []
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .array
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        self.collectValues()
    }
    
    func collectValues() {
        for child in rawValue.getNamedChildren() {
            let contents = rawValue.getContents(of: child, in: content)
            if let primitive = PrimitiveFactory.derivePrimitive(node: child, content: contents) {
                values.append(primitive)
            }
        }
        
        print("Found \(values.count) values - \(values.map({$0.content}))")
    }
}

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
                ErrorHandler.shared.reportError(error: .generic(description: "Empty Interpolation", recoveryStrategy: "Interpolation can not be empty, please add an identifier", level: .error), node: self)
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
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .string
        self.sString = sString
        self.originalContent = content
        self.content = content
        self.rawValue = rawValue
        
        self.collectValues()
    }
    
    init(content: String, rawValue: TreeSitterNode) {
        self.type = .string
        self.sString = ""
        self.originalContent = content
        self.content = content
        self.rawValue = rawValue
    }
    
    func collectValues() {
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

final class VariableNode: CoreNode, CorePrimitiveNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
        
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .string
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
}
