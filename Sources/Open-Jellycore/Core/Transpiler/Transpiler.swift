//
//  Transpiler.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

class Transpiler {
    static let globalVariables: [Variable] = [
        Variable(uuid: "", name: "ShortcutInput", valueType: .global, value: ""),
        Variable(uuid: "", name: "Clipboard", valueType: .global, value: ""),
        Variable(uuid: "", name: "CurrentDate", valueType: .global, value: ""),
        Variable(uuid: "", name: "Ask", valueType: .global, value: ""),
        Variable(uuid: "", name: "RepeatItem", valueType: .global, value: ""),
        Variable(uuid: "", name: "RepeatIndex", valueType: .global, value: ""),
        Variable(uuid: "", name: "DeviceDetails", valueType: .global, value: "")
    ]

    var contents: String {
        return currentParser?.contents ?? ""
    }
    var currentParser: Parser? = nil
    var lookupTable: [String: AnyAction] = TranspilerLookupTables.generateLookupTable(importedLibraries: [.shortcuts])

    func compile(with parser: Parser) throws {
        currentParser = parser
        guard let tree = parser.tree else {
            throw JellycoreError.noParserTree()
        }
        
        let rootNode = tree.rootNode()
        guard rootNode.type == "source_file" else {
            throw JellycoreError.invalidRoot()
        }
        
        var shortcutsActions: [WFAction] = []
    
        for child in rootNode.getChildren() {
            do {
                let actions = try compileNode(node: child, scope: [])
                shortcutsActions.append(contentsOf: actions)
            } catch {
                print("Error Compiling node \(child.string ?? "No String") - \(error)")
            }
        }
        
        print("Got \(shortcutsActions.count) Actions - \(shortcutsActions)")
    }
    
    func compileNode(node: TreeSitterNode, scope: [Variable]) throws -> [WFAction] {
        let coreNode = try translateNodeFromTreeSitterNode(node: node)
        guard let coreNode else { print("Unable to get core node - \(node.type ?? "No Type")"); return [] }
        var actions: [WFAction] = []
        var scope: [Variable] = []
        print("Got Node \(coreNode)")
        
        switch coreNode.type {
        case .flag:
            // TODO: Implement Flag Nodes
            break
        case .import:
            // TODO: Implement Import Nodes
            break
        case .repeat:
            // TODO: Implement Repeat Nodes
            break
        case .repeatEach:
            // TODO: Implement Repeat Nodes
            break
        case .conditional:
            // TODO: Implement Conditional Nodes
            break
        case .conditionalElse:
            // TODO: Implement Conditional Nodes
            break
        case .menu:
            // TODO: Implement Menu Nodes
            break
        case .function:
            // TODO: Implement Function Nodes
            break
        case .macro:
            // TODO: Implement Macro Nodes
            break
        case .variableDeclaration, .setVariable:
            guard let coreNode = coreNode as? VariableAssignmentNode else {
                throw JellycoreError.typeError(type: "VariableDeclarationNode", description: "Node type does not match struct type")
            }

            let results = try compileVariableDeclaration(node: coreNode, scopedVariables: scope)
            
            actions.append(contentsOf: results.actions)
            scope.append(contentsOf: results.variables)
        case .functionCall:
            guard let coreNode = coreNode as? FunctionCallNode else {
                throw JellycoreError.typeError(type: "FunctionCallNode", description: "Node type does not match struct type")
            }

            if let functionCallAction = try compileFunctionCall(node: coreNode) {
                actions.append(functionCallAction)
            } else {
                print("Unable to generate action")
            }
        case .comment, .blockComment:
            guard let coreNode = coreNode as? CommentNode else {
                throw JellycoreError.typeError(type: "Comment", description: "Node type does not match struct type")
            }
            
            let commentAction = try compileComment(node: coreNode)
            actions.append(commentAction)
        default:
            print("Unhandled Node on Compile step \(coreNode.content) - \(coreNode.sString)")
            break
        }
        
        return actions
    }
}

// MARK: Transpile Individual Nodes
/// Any functions that transpiler individual CoreNodes into Shortcuts Actions
extension Transpiler {
    
    private func compileVariableDeclaration(node: VariableAssignmentNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        // TODO: Check to make sure variable is available
        if Transpiler.globalVariables.contains(where: { variableNameMatches(variable: $0, name: node.name) }) {
            // TODO: Error Reporting
            return ([], [])
        }
        
        let existingVariable: Variable? = scopedVariables.first(where: { variableNameMatches(variable: $0, name: node.name) })

        if let valuePrimitive = node.valuePrimitive {
            var scopedVariables: [Variable] = scopedVariables
            let nodeType = valuePrimitive.type
            var actions: [WFAction] = []
                        
            if nodeType == .string {
                let textUUID = UUID().uuidString
                let magicVariable = Variable(uuid: textUUID, name: "Generated Magic Variable \(textUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = TranspilerLookupTables.shortcutsFunctions["text"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "text", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scopedVariables)
                    
                    actions.append(builtFunction)
                }
                
                
                let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scopedVariables)), "WFVariableName": QuantumValue(node.name)])
                
                // Add the magic variable pointing to the string function to the scope
                scopedVariables.append(magicVariable)
                if let existingVariable {
                    existingVariable.value = node.value
                    existingVariable.valueType = .string
                } else {
                    // Add the variable we just created to the scope
                    scopedVariables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: .string, value: node.value))
                }
                actions.append(variableAction)
            } else if nodeType == .number {
                let numberUUID = UUID().uuidString
                let magicVariable = Variable(uuid: numberUUID, name: "Generated Magic Variable \(numberUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = TranspilerLookupTables.shortcutsFunctions["number"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "value", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scopedVariables)
                    
                    actions.append(builtFunction)
                }
                
                
                let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scopedVariables)), "WFVariableName": QuantumValue(node.name)])
                
                // Add the magic variable pointing to the string function to the scope
                scopedVariables.append(magicVariable)

                if let existingVariable {
                    existingVariable.value = node.value
                    existingVariable.valueType = .number
                } else {
                    // Add the variable we just created to the scope
                    scopedVariables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: .number, value: node.value))
                }
                
                actions.append(variableAction)
            } else {
                if let variableReference = JellyVariableReference(valuePrimitive, scopedVariables: scopedVariables) {
                    let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(variableReference), "WFVariableName": QuantumValue(valuePrimitive.content)])
                    actions.append(variableAction)
                    
                    let type: Variable.ValueType = Transpiler.globalVariables.contains(where: {variableNameMatches(variable: $0, name: valuePrimitive.content)}) ? .global : .magicVariable
                    
                    if let existingVariable {
                        existingVariable.value = node.value
                        existingVariable.valueType = type
                    } else {
                        // Add the variable we just created to the scope
                        scopedVariables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: type, value: node.value))
                    }
                }
            }

            
            return (actions, scopedVariables)
        }

        return ([], [])
    }
    
    private func compileFunctionCall(node: FunctionCallNode) throws -> WFAction? {
        if let foundFunction = lookupTable[node.name.lowercased()] {
            let builtFunction = foundFunction.build(call: node.parameters, magicVariable: nil, scopedVariables: [])
            return builtFunction
        } else {
            // TODO: We have to handle custom user inputted functions
//            if let customFunction = userDefinedFunctions[node.content] {
////                            actions.append(customFunction.build)
//            } else {
//                ErrorReporter.shared.report(error: .functionNotFound(functionName: node.content), textPosition: node.textPosition)
//            }
        }
        return nil
    }
    
    private func compileComment(node: CommentNode) throws -> WFAction {
        guard let content = node.getContent() else {
            throw JellycoreError.invalidContent(type: "Comment", description: "No comment content was found")
        }
        let commentParameters: [String: QuantumValue] = ["WFCommentActionText": QuantumValue(content)]
        let action: WFAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.comment", WFWorkflowActionParameters: commentParameters)
        return action
    }
}


// MARK: Transpiling Helpers
/// Any functions that are directly helpful to transpiling
extension Transpiler {
    private func translateNodeFromTreeSitterNode(node: TreeSitterNode) throws -> CoreNode? {
        if let type = node.type {
            guard let nodeType = CoreNodeType(rawValue: type) else {
                throw JellycoreError.invalidTreeSitterType(type: type)
            }
            
            let sString = node.string ?? "(empty)"
            let content = node.getContents(in: contents)

            switch nodeType {
            case .flag:
                return FlagNode(sString: sString, content: content, rawValue: node)
            case .import:
                return ImportNode(sString: sString, content: content, rawValue: node)
            case .variableDeclaration, .setVariable:
                return VariableAssignmentNode(sString: sString, content: content, rawValue: node)
            case .functionCall:
                return FunctionCallNode(sString: sString, content: content, rawValue: node)
            case .comment, .blockComment:
                return CommentNode(sString: sString, content: content, rawValue: node)
            default:
                print("Unhandled Node on Translate step \(content) - \(sString)")
                break
            }
        } else {
            print("Child with no type found \(node.string ?? "No String Either")")
        }
        
        return nil
    }
}

// MARK: Filters and Array searches
extension Transpiler {
    private func variableNameMatches(variable: Variable, name: String) -> Bool {
        return variable.name == name
    }
}
