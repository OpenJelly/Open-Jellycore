//
//  ImpportNode.swift
//  
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

final class ImportNode: ParserNode {
    var type: ParserNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .import
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    func getImportedLibrary() -> String? {
        if let idNode = rawValue.getChild(by: "library") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
}
