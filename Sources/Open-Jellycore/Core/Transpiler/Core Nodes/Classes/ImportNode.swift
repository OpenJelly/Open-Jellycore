//
//  ImportNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

/// Represents a node where the user imports a library.
final class ImportNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    /// Initializes a Import  node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .import
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    /// Retrieves the name of the imported library
    /// - Returns: The name of the library if it is present in the node. If not, nil is returned.
    func getImportedLibrary() -> String? {
        if let idNode = rawValue.getChild(by: "library") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
}
