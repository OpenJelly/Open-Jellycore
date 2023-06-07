//
//  FunctionCallNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import TreeSitter

/// A node that represents the cal to a shortcuts function.
final class FunctionCallNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    var name: String = "unnamed"
    
    var parameters: [FunctionCallParameterItem] = []
    var magicVariable: MagicVariableNode?
    
    /// Initializes a Functional call node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .functionCall
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let name = getFunctionName() {
            self.name = name
        }
        
        collectParameters()
        collectMagicVariable()
    }
    
    /// Collects the functions parameters by looping through the children of the parameter child node
    private func collectParameters() {
        if let parameterListNode = rawValue.getChild(by: "parameters") {
            for child in parameterListNode.getNamedChildren() {
                if child.type == CoreNodeType.parameterListItem.rawValue {
                    let sString = child.string ?? "(empty)"
                    let content = rawValue.getContents(of: child, in: content)

                    parameters.append(FunctionCallParameterItem(sString: sString, content: content, rawValue: child))
                }
            }
        } else {
            print("Unable to get parameters")
        }
    }
    
    /// Retrieves the name of the function
    /// - Returns: If the name exists, the name is returned as a string. If there is no name nil is returned..
    func getFunctionName() -> String? {
        if let nameNode = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: nameNode, in: content)
        }
        return nil
    }
    
    /// Collects the magic variable that may follow a function call.
    func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}

/// A  node that represents an individual parameter item within a function call.
final class FunctionCallParameterItem: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var slotName: String?
    var item: CorePrimitiveNode?
    
    /// Initializes a Function Call Parameter Item node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .parameterListItem
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        self.item = getItem()
        self.slotName = getParameterName()
    }
    
    /// An initializer that takes a slot name followed by the primitive item that should be populated in the slot. This is used for the compiler to build it's own function calls when necessary.
    /// - Parameters:
    ///   - slotName: The slot name to assign to the parameter item
    ///   - item: The primitive node to assign to the parameter item.
    init(slotName: String, item: CorePrimitiveNode) {
        self.type = .parameterListItem
        self.sString = ""
        self.content = item.content
        self.rawValue = TreeSitterNode(rawNode: TSNode())
        
        self.item = item
        self.slotName = slotName
    }
    
    /// Retrieves the parameter name. This is used to populate slot name
    /// - Returns: The possible parameter name if one exists. If it does not, nil is returned.
    func getParameterName() -> String? {
        if let nameNode = rawValue.getChild(by: "parameter_name") {
            return rawValue.getContents(of: nameNode, in: content)
        }
        return nil
    }

    /// Retrieves the primitive node that is contained by the parameter item.
    /// - Returns: The possible primitive node. Nil is returned if there is no item.
    func getItem() -> CorePrimitiveNode? {
        if let itemNode = rawValue.getChild(by: "item") {
            let contents = rawValue.getContents(of: itemNode, in: content)
            return PrimitiveFactory.derivePrimitive(node: itemNode, content: contents)
        }
        
        return nil
    }
}
