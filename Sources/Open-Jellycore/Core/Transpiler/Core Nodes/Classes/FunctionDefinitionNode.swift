//
//  FunctionDefinitionNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/2/23.
//

import Foundation

final class FunctionDefinitionNode: CoreNode {
    var type: CoreNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    var name: String = "unnamed"

    var parameters: [FunctionCallParameterItem] = []
    var body: BlockNode?

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
    
    private func getName() -> String? {
        if let node = rawValue.getChild(by: "name") {
            return rawValue.getContents(of: node, in: content)
        }
        return nil
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

    private func getBodyNode() -> (node: TreeSitterNode, content: String)? {
        if let node = rawValue.getChild(by: "body") {
            let content = rawValue.getContents(of: node, in: content)
            return (node, content)
        }
        return nil
    }
    
    
    
    func build(call: [FunctionCallParameterItem], magicVariable: Variable?, scopedVariables: [Variable], fileName: String) throws -> [WFAction] {
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
        runShortcut(name: "\(fileName)", input: dictionaryVariable, show: true)
        """
        
        let internalParser = Parser(contents: callCode)
        try internalParser.parse()
        let internalTranspiler = Transpiler(parser: internalParser)

        let scope = Scope(variables: scopedVariables, functions: [], fileName: fileName)
        let callActions = try internalTranspiler.getCompiledActions(scope: scope)
                
        return callActions
    }
}

/*

 let type: ParameterType = ParameterType.build(call: call, scopedVariables: scopedVariables) as! ParameterType
 var parameters: [String: QuantumValue] = type.asDictionary()

 if let magicVariable = magicVariable {
     parameters.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
         return first
     }
 }

 return WFAction(WFWorkflowActionIdentifier: identifier, WFWorkflowActionParameters: parameters)

 func buildCall(textPosition: TextPosition, call: [ParameterNode], magicVariable: Variable?, scopedVariables: [Variable]) -> [WFAction] {
     var newCall: [ParameterNode] = []
     

     return []
 }

 */
