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
    enum InternalNodeType {
        case text
        case interpolation
    }
    
    var type: CoreNodeType
    var sString: String
    var originalContent: String
    var content: String
    var rawValue: TreeSitterNode
    
    var internalNodes: [(type: InternalNodeType, node: TreeSitterNode, localRange: Range<Int>)] = []
    
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
                internalNodes.append((InternalNodeType.text, child, range))
            } else if fieldName == "interpolation" {
                internalNodes.append((InternalNodeType.interpolation, child, range))
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
