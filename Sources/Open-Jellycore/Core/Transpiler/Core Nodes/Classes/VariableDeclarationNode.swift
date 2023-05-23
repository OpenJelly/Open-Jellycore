//
//  VariableDeclarationNode.swift
//  Open-Jellyore
//
//  Created by Taylor Lineman on 5/23/23.
//

final class VariableDeclarationNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    var name: String = ""
    var value: String = ""
    var valuePrimitive: CorePrimitiveNode?

    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .variableDeclaration
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        self.name = getName() ?? ""
        self.value = getValue() ?? ""
    }
    
    func getName() -> String? {
        if let node = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: node, in: content)
        }
        return nil
    }
    
    func getValue() -> String? {
        if let node = rawValue.getChild(by: "value") {
            let contents = rawValue.getContents(of: node, in: content)
            valuePrimitive = PrimitiveFactory.derivePrimitive(node: node, content: contents)
            return contents
        }
        return nil
    }

}
