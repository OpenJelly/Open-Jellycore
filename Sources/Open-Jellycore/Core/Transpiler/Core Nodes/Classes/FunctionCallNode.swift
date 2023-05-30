//
//  FunctionCallNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import TreeSitter

final class FunctionCallNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    var name: String = "unnamed"
    
    var parameters: [FunctionCallParameterItem] = []
    var magicVariable: MagicVariableNode?
    
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
    
    func getFunctionName() -> String? {
        if let nameNode = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: nameNode, in: content)
        }
        return nil
    }
    
    func collectMagicVariable() {
        if let magicVariableNode = rawValue.getChild(by: "magic_variable") {
            let content = rawValue.getContents(of: magicVariableNode, in: content)
            self.magicVariable = MagicVariableNode(sString: magicVariableNode.string ?? "No sString", content: content, rawValue: magicVariableNode)
        }
    }
}

final class FunctionCallParameterItem: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var slotName: String?
    var item: CorePrimitiveNode?
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .parameterListItem
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        self.item = getItem()
        self.slotName = getParameterName()
    }
    
    init(slotName: String, item: CorePrimitiveNode) {
        self.type = .parameterListItem
        self.sString = ""
        self.content = item.content
        self.rawValue = TreeSitterNode(rawNode: TSNode())
        
        self.item = item
        self.slotName = slotName
    }
    
    func getParameterName() -> String? {
        if let nameNode = rawValue.getChild(by: "parameter_name") {
            return rawValue.getContents(of: nameNode, in: content)
        }
        return nil
    }

    func getItem() -> CorePrimitiveNode? {
        if let itemNode = rawValue.getChild(by: "item") {
            let contents = rawValue.getContents(of: itemNode, in: content)
            return PrimitiveFactory.derivePrimitive(node: itemNode, content: contents)
        }
        
        return nil
    }
}
