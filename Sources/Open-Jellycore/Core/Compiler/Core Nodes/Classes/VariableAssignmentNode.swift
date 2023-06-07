//
//  VariableAssignmentNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/28/23.
//

/// A node that represents a variable assignment. Can also represent variable instantiation as they are very close in shortcuts so are represented as the same internal type in Jelly.
final class VariableAssignmentNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var name: String = ""
    var value: String = ""
    var valuePrimitive: CorePrimitiveNode?

    /// Initializes a Variable Assignment Node node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .variableDeclaration
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        self.name = getName() ?? ""
        self.value = getValue() ?? ""
    }
    
    /// Retrieves the name that the user has set for the variable.
    /// - Returns: The name of the variable if one exists. If it does not, nil is returned
    private func getName() -> String? {
        if let node = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: node, in: content)
        }
        return nil
    }
    
    /// Retrieves the value that the user has set for the variable.
    /// - Returns: The value of the variable if one exists. If it does not, nil is returned
    private func getValue() -> String? {
        if let node = rawValue.getChild(by: "value") {
            let contents = rawValue.getContents(of: node, in: content)
            valuePrimitive = PrimitiveFactory.derivePrimitive(node: node, content: contents)
            return contents
        }
        return nil
    }
}
