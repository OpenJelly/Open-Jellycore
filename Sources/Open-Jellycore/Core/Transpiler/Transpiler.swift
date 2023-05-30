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
        
        let results = compileBlock(root: rootNode, variableScope: [])
        
        print("Got \(results.scope.count) Variables - \(results.scope.map({$0.name}))")
        print("Got \(results.actions.count) Actions - \(results.actions)")
    }
    
    private func compileBlock(root: TreeSitterNode, variableScope: [Variable]) -> (actions: [WFAction], scope: [Variable]){
        var shortcutsActions: [WFAction] = []
        var variableScope: [Variable] = variableScope

        for child in root.getChildren() {
            do {
                let results = try compileNode(node: child, scope: variableScope)
                
                shortcutsActions.append(contentsOf: results.actions)
                variableScope = results.scope
            } catch {
                print("Error Compiling node \(child.string ?? "No String") - \(error.localizedDescription)")
            }
        }
        
        return (shortcutsActions, variableScope)
    }
    
    private func compileNode(node: TreeSitterNode, scope: [Variable]) throws -> (actions: [WFAction], scope: [Variable]) {
        let coreNode = try translateNodeFromTreeSitterNode(node: node)
        guard let coreNode else { print("Unable to get core node - \(node.type ?? "No Type")"); return ([], scope) }
        var actions: [WFAction] = []
        var scope: [Variable] = scope
        
        switch coreNode.type {
        case .flag:
            // TODO: Implement Flag Nodes
            break
        case .import:
            // TODO: Implement Import Nodes
            break
        case .repeat:
            guard let coreNode = coreNode as? RepeatNode else {
                throw JellycoreError.typeError(type: "RepeatNode", description: "Node type does not match struct type")
            }

            let results = try compileRepeat(node: coreNode, scopedVariables: scope)
            
            actions.append(contentsOf: results.actions)
            scope = results.variables
        case .repeatEach:
            guard let coreNode = coreNode as? RepeatEachNode else {
                throw JellycoreError.typeError(type: "RepeatEachNode", description: "Node type does not match struct type")
            }

            let results = try compileRepeatEach(node: coreNode, scopedVariables: scope)
            
            actions.append(contentsOf: results.actions)
            scope = results.variables
        case .conditional:
            guard let coreNode = coreNode as? ConditionalNode else {
                throw JellycoreError.typeError(type: "ConditionalNode", description: "Node type does not match struct type")
            }

            let results = try compileConditional(node: coreNode, scopedVariables: scope)
            
            actions.append(contentsOf: results.actions)
            scope = results.variables
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
            scope = results.variables
        case .functionCall:
            guard let coreNode = coreNode as? FunctionCallNode else {
                throw JellycoreError.typeError(type: "FunctionCallNode", description: "Node type does not match struct type")
            }

            if let functionCallAction = try compileFunctionCall(node: coreNode, scopedVariables: scope) {
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
        
        return (actions, scope)
    }
}

// MARK: Transpile Individual Nodes
/// Any functions that transpiler individual CoreNodes into Shortcuts Actions
extension Transpiler {
    
    private func compileRepeatEach(node: RepeatEachNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        let scopedVariables: [Variable] = scopedVariables
        var actions: [WFAction] = []

        if let identifier = node.identifier,
           let variableReference = JellyVariableReference(identifierNode: identifier, scopedVariables: scopedVariables) {
            let repeatUUID = UUID().uuidString
            
            let repeatHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.each", WFWorkflowActionParameters: [
                "WFControlFlowMode": QuantumValue(0),
                "WFInput": QuantumValue(variableReference),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ])

            actions.append(repeatHeadAction)

            if let body = node.body {
                let compilationResults = compileBlock(root: body.rawValue, variableScope: scopedVariables)
                actions.append(contentsOf: compilationResults.actions)
                // TODO: Figure out how shortcuts handles variables within if statements
//                    scopedVariables.append(contentsOf: compilationResults.scope)
            }
            
            var repeatTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ]
                               
            let repeatTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: repeatTailDictionary)

            actions.append(repeatTailAction)
        }
        
        return (actions, scopedVariables)
    }

    private func compileRepeat(node: RepeatNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        let scopedVariables: [Variable] = scopedVariables
        var actions: [WFAction] = []

        if let amount = node.amount {
            let value = amount.getValue()
            let repeatUUID = UUID().uuidString
            
            let repeatHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: [
                "WFControlFlowMode": QuantumValue(0),
                "WFRepeatCount": QuantumValue(value),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ])
            
            actions.append(repeatHeadAction)

            if let body = node.body {
                let compilationResults = compileBlock(root: body.rawValue, variableScope: scopedVariables)
                actions.append(contentsOf: compilationResults.actions)
                // TODO: Figure out how shortcuts handles variables within if statements
//                    scopedVariables.append(contentsOf: compilationResults.scope)
            }
            
            var repeatTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ]
                               
            let repeatTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: repeatTailDictionary)

            actions.append(repeatTailAction)

        }
        
        return (actions, scopedVariables)
    }
    
    private func compileConditional(node: ConditionalNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        let scopedVariables: [Variable] = scopedVariables
        var actions: [WFAction] = []

        if let primaryNode = node.primaryNode,
           let primaryVariableReference = JellyVariableReference(identifierNode: primaryNode, scopedVariables: scopedVariables) {
            let conditionalUUID = UUID().uuidString
            
            if let operatorNode = node.operatorNode,
               let secondaryNode = node.secondaryNode {
                // MARK: We have all three slots filled

                var condition = operatorNode.operatorType.shortcutsConditionNumber
                
                // If we are checking for nil, we need to swap the condition number to what shortcut's recognizes as checking if something exists or not
                if secondaryNode.content == "nil" {
                    if condition == OperatorNode.OperatorType.equals.shortcutsConditionNumber {
                        condition = 101 // Does not exist
                    } else if condition == OperatorNode.OperatorType.notEquals.shortcutsConditionNumber {
                        condition = 100 // Does exist
                    }
                }
                
                // Automatically guess we are taking in a string, if not we will change it in the upcoming switch
                var parameterType: ConditionalType = .string
                var inputTwo: QuantumValue = QuantumValue(JellyString(secondaryNode, scopedVariables: scopedVariables))
                
                if secondaryNode.type == .number {
                    if let double = JellyDouble(secondaryNode, scopedVariables: scopedVariables) {
                        parameterType = .number
                        inputTwo = QuantumValue(double)
                    }
                } else if secondaryNode.type == .identifier {
                    // TODO: Implement a way to convert an identifier node into a StringNode with interpolation of the original identifier node.
                }
                
                // MARK: Make the WFActions
                let conditionalHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.conditional", WFWorkflowActionParameters: [
                    "WFControlFlowMode": QuantumValue(0),
                    "GroupingIdentifier": QuantumValue(conditionalUUID),
                    "WFCondition": QuantumValue(condition),
                    "WFInput": QuantumValue([
                        "Type": "Variable",
                        "Variable": primaryVariableReference
                    ] as [String : Any]),
                    parameterType.rawValue: inputTwo,
                ])
                                
                actions.append(conditionalHeadAction)
            } else {
                // MARK: We are using a singular variable as a boolean
                let conditionalHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.conditional", WFWorkflowActionParameters: [
                    "WFControlFlowMode": QuantumValue(0),
                    "GroupingIdentifier": QuantumValue(conditionalUUID),
                    "WFCondition": QuantumValue(0),
                    "WFInput": QuantumValue([
                        "Type": "Variable",
                        "Variable": primaryVariableReference
                    ] as [String : Any])
                ])
                                
                actions.append(conditionalHeadAction)
            }
            
            // MARK: Compile Body
            if let body = node.body {
                let compilationResults = compileBlock(root: body.rawValue, variableScope: scopedVariables)
                actions.append(contentsOf: compilationResults.actions)
                // TODO: Figure out how shortcuts handles variables within if statements
//                    scopedVariables.append(contentsOf: compilationResults.scope)
            }
            
            if let elseNode = node.elseNode {
                let elseAction: WFAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.conditional", WFWorkflowActionParameters: [
                    "GroupingIdentifier": QuantumValue(conditionalUUID),
                    "WFControlFlowMode": QuantumValue(1)
                ])
                actions.append(elseAction)
                
                if let body = elseNode.body {
                    let compilationResults = compileBlock(root: body.rawValue, variableScope: scopedVariables)
                    actions.append(contentsOf: compilationResults.actions)
                    // TODO: Figure out how shortcuts handles variables within if statements
    //                    scopedVariables.append(contentsOf: compilationResults.scope)
                }
            }

            // MARK: Compile Tail
            let conditionalTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(conditionalUUID)
            ]
            let conditionalTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.conditional", WFWorkflowActionParameters: conditionalTailDictionary)

            actions.append(conditionalTailAction)

        } else {
            print("Unable to initialize due to invalid primary node")
        }
        
        return (actions, scopedVariables)
    }
    
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
    
    private func compileFunctionCall(node: FunctionCallNode, scopedVariables: [Variable]) throws -> WFAction? {
        if let foundFunction = lookupTable[node.name.lowercased()] {
            let builtFunction = foundFunction.build(call: node.parameters, magicVariable: nil, scopedVariables: scopedVariables)
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
            case .conditional:
                return ConditionalNode(sString: sString, content: content, rawValue: node)
            case .repeat:
                return RepeatNode(sString: sString, content: content, rawValue: node)
            case .repeatEach:
                return RepeatEachNode(sString: sString, content: content, rawValue: node)
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
