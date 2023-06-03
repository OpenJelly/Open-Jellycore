//
//  FlagNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

/// An enumeration that represents all of the available flag names recognized by Jelly. Their raw value is the test that follows a # when typed by the user.
enum FlagName: String {
    case icon = "Icon"
    case color = "Color"
}

/// A core node class that represents a flag.
final class FlagNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    /// Initializes a Flag node.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .flag
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
    
    /// Retrieve the name of the flag
    /// - Returns: Returns an optional string that contains the name if one exists. If a name does not exist, it returns nil.
    func getFlagName() -> String? {
        if let idNode = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
    
    /// Retrieve the value of a flag
    /// - Returns: Returns an optional string that contains the value of the flag if one exists. If a value does not exists, it returns nil.
    func getFlagValue() -> String? {
        if let idNode = rawValue.getChild(by: "value") {
            return rawValue.getContents(of: idNode, in: content)
        }
        return nil
    }
}
