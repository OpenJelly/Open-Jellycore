//
//  FunctionDefinitionNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/2/23.
//

/// A node that represents a function defined with the `func` keyword.
final class FunctionDefinitionNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    var name: String = "unnamed"

    var parameters: [FunctionCallParameterItem] = []
    var body: BlockNode?

    
    /// Initializes a Function Definition node. Internally fills out the optional values by calling all of this class's get functions.
    /// - Parameters:
    ///   - sString: The TreeSitter String representation of the `rawValue` node.
    ///   - content: The content of the `rawValue`. This is passed in as a constructor because it requires `rawValue`'s parent's content to retrieve it's contents
    ///   - rawValue: The raw TreeSitter node that this node wraps.
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .function
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
    
    /// This function builds a function call. This call is different than an ``Action/build(call:magicVariable:scopedVariables:)``, that will build a single action that is analogous to a shortcuts action. However this action creates a dictionary and a run shortcut function that informs the shortcut how to re-run itself an enter the specified function.
    /// - Parameters:
    ///   - call: The list of `FunctionCallParameterItem`s that was used when the function was called by the user.
    ///   - magicVariable: A magic variable that this action should insert into it's `WFAction` parameters.
    ///   - scope; The scope that the function is being compiled in.
    /// - Returns: A list of ``WFAction``s that create a call to the function.
    func build(call: [FunctionCallParameterItem], magicVariable: Variable?, scope: Scope) throws -> [WFAction] {
        for parameter in call {
            if parameter.slotName == nil {
                ErrorReporter.shared.reportError(error: .missingParameterName(function: name, name: "PLACEHOLDER"), node: parameter)
            }
        }
        
        // MARK: Create Calling Dictionary
        var craftedJSON = "{\"FUNCTION_CALL_NAME\":\"\(name)\""
        
        for parameter in call {
             if parameter.type == .number {
                // Create a dictionary number input
                 craftedJSON += ", \"\(parameter.slotName ?? "nil")\":\(parameter.content)"
             } else if parameter.type == .identifier {
                // Create a dictionary variable call entry using a string
                let newContent = "${\(parameter.content)}"
                craftedJSON += ", \"\(parameter.slotName ?? "nil")\":\"\(newContent)\""
            } else {
                // Create aa dictionary text entry
                craftedJSON += ", \"\(parameter.slotName ?? "nil")\":\"\(parameter.item?.content ?? parameter.content)\""
            }
        }
        craftedJSON += "}"
        craftedJSON = craftedJSON.replacingOccurrences(of: #"""#, with: #"\""#)
        
        let callCode = """
        dictionary(json: "\(craftedJSON)") >> dictionaryVariable
        runShortcut(name: "\(scope.fileName)", input: dictionaryVariable, show: true)
        """
        
        let internalParser = Parser(contents: callCode)
        try internalParser.parse()
        let internalTranspiler = Transpiler(parser: internalParser)

        let scope = Scope(parentScope: scope)
        let callActions = try internalTranspiler.getCompiledActions(scope: scope)
                
        return callActions
    }
}
