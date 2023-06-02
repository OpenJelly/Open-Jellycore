//
//  FlagNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

enum FlagName: String {
    case icon = "Icon"
    case color = "Color"
}

final class FlagNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .flag
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    func getFlagName() -> String? {
        if let idNode = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
    
    func getFlagValue() -> String? {
        if let idNode = rawValue.getChild(by: "value") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
}
