//
//  MacroDefinitionNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/7/23.
//

/// A node that represents a macro defined with the `macro` keyword.
final class MacroDefinitionNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    var name: String = "unnamed"

    var parameters: [FunctionCallParameterItem] = []
    var body: BlockNode?

    
    /// Initializes a Macro Definition node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .macro
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
        
        if let name = getName() {
            self.name = name
        }
        
        if let bodyResults = getBodyNode() {
            self.body = BlockNode(sString: bodyResults.node.string ?? "(empty)", content: bodyResults.content, rawValue: bodyResults.node)
        }

        collectParameters()
    }
    
    /// Retrieves the name of the function
    /// - Returns: If the name exists, the name is returned as a string. If there is no name nil is returned..
    private func getName() -> String? {
        if let node = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: node, in: content)
        }
        return nil
    }
    
    /// A function that collects all of the parameters included in the `parameters` child.
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
    
    /// Retrieves the body of the function statement
    /// - Returns: Returns an optional tuple of node (TreeSitterNode) and content (String). Node is the node that represents the body of the function statement. And contents is the string contents of that node.
    private func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
}
