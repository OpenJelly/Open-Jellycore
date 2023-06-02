//
//  Transpiler.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

public final class Transpiler {
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
        return currentParser.contents
    }
    var currentParser: Parser
    var lookupTable: [String: AnyAction] = TranspilerLookupTables.generateLookupTable(importedLibraries: [.shortcuts])

    public init(parser: Parser) {
        self.currentParser = parser
    }
    
    public func compile() throws -> String {
        guard let tree = currentParser.tree else {
            throw JellycoreError.noParserTree()
        }
        
        let rootNode = tree.rootNode()
        guard rootNode.type == "source_file" else {
            throw JellycoreError.invalidRoot()
        }
        
        let scope = Scope()
        let actions = compileBlock(root: rootNode, scope: scope)
        
        print("Got \(scope.variables.count) Variables - \(scope.variables.map({$0.name}))")
        print("Got \(actions.count) Actions - \(actions)")
        
        var shortcut = WFShortcut()
        shortcut.WFWorkflowActions = actions
        
        if let icon = shortcut.WFWorkflowActions.first(where: { action in
            return action.WFWorkflowActionIdentifier == "jelly.config.icon"
        }) {
            print("Got Icon")
            shortcut.WFWorkflowIcon.WFWorkflowIconGlyphNumber = icon.WFWorkflowActionParameters["VALUE"]?.value as? Int ?? ShortcutGlyph.shortcuts.id
            shortcut.WFWorkflowActions.removeAll { action in
                return action.WFWorkflowActionIdentifier == "jelly.config.icon"
            }
        }
        
        if let color = shortcut.WFWorkflowActions.first(where: { action in
            return action.WFWorkflowActionIdentifier == "jelly.config.color"
        }) {
            print("Got Color")
            shortcut.WFWorkflowIcon.WFWorkflowIconStartColor = color.WFWorkflowActionParameters["VALUE"]?.value as? Int ?? ShortcutColor.red.id
            shortcut.WFWorkflowActions.removeAll { action in
                return action.WFWorkflowActionIdentifier == "jelly.config.color"
            }
        }
                
        let encodedShortcut = try encodeShortcut(shortcut: shortcut)

        return encodedShortcut
    }
    
    private func encodeShortcut(shortcut: WFShortcut) throws -> String {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(shortcut)
            if let stringRepresentation = String(data: data, encoding: .utf8) {
                return stringRepresentation
            } else {
                throw JellycoreError.unableToEncode(identifier: "WFShortcut")
            }
        } catch let error as JellycoreError {
            ErrorReporter.shared.reportError(error: error, node: nil)
            throw error
        } catch {
            ErrorReporter.shared.reportError(error: .generic(description: error.localizedDescription, recoveryStrategy: "Contact the developer", level: .fatal), node: nil)
            throw error
        }
    }

    private func compileBlock(root: TreeSitterNode, scope: Scope) -> [WFAction] {
        var shortcutsActions: [WFAction] = []

        for child in root.getChildren() {
            do {
                let results = try compileNode(node: child, scope: scope)
                
                shortcutsActions.append(contentsOf: results)
            } catch let error as JellycoreError {
                ErrorReporter.shared.reportError(error: error, node: nil)
            }  catch {
                ErrorReporter.shared.reportError(error: .generic(description: error.localizedDescription, recoveryStrategy: "Contact the developer", level: .fatal), node: nil)
            }
        }
        
        return shortcutsActions
    }
    
    private func compileNode(node: TreeSitterNode, scope: Scope) throws -> [WFAction] {
        let coreNode = try translateNodeFromTreeSitterNode(node: node)
        guard let coreNode else { print("Unable to get core node - \(node.type ?? "No Type")"); return [] }
        var actions: [WFAction] = []
        
        switch coreNode.type {
        case .flag:
            guard let coreNode = coreNode as? FlagNode else {
                throw JellycoreError.typeError(type: "FlagNode", description: "Node type does not match struct type")
            }
            let results = try compileFlag(node: coreNode)
            actions.append(contentsOf: results)
        case .import:
            // TODO: Implement Import Nodes
            break
        case .repeat:
            guard let coreNode = coreNode as? RepeatNode else {
                throw JellycoreError.typeError(type: "RepeatNode", description: "Node type does not match struct type")
            }

            let results = try compileRepeat(node: coreNode, scope: scope)
            
            actions.append(contentsOf: results)
        case .repeatEach:
            guard let coreNode = coreNode as? RepeatEachNode else {
                throw JellycoreError.typeError(type: "RepeatEachNode", description: "Node type does not match struct type")
            }

            let results = try compileRepeatEach(node: coreNode, scope: scope)
            
            actions.append(contentsOf: results)
        case .conditional:
            guard let coreNode = coreNode as? ConditionalNode else {
                throw JellycoreError.typeError(type: "ConditionalNode", description: "Node type does not match struct type")
            }

            let results = try compileConditional(node: coreNode, scope: scope)
            
            actions.append(contentsOf: results)
        case .menu:
            guard let coreNode = coreNode as? MenuNode else {
                throw JellycoreError.typeError(type: "MenuNode", description: "Node type does not match struct type")
            }

            let results = try compileMenu(node: coreNode, scope: scope)
            
            actions.append(contentsOf: results)
        case .function:
            guard let coreNode = coreNode as? FunctionDefinitionNode else  {
                throw JellycoreError.typeError(type: "FunctionDefinitionNode", description: "Node type does not match struct type")
            }
            
            guard !scope.functions.contains(where: { function in
                return function.name == coreNode.name
            }) else {
                throw JellycoreError.invalidFunctionRedeclaration(name: coreNode.name)
            }
            
            scope.functions.append(coreNode)
        case .macro:
            // TODO: Implement Macro Nodes
            break
        case .variableDeclaration, .setVariable:
            guard let coreNode = coreNode as? VariableAssignmentNode else {
                throw JellycoreError.typeError(type: "VariableDeclarationNode", description: "Node type does not match struct type")
            }

            let results = try compileVariableDeclaration(node: coreNode, scope: scope)
            
            actions.append(contentsOf: results)
        case .functionCall:
            guard let coreNode = coreNode as? FunctionCallNode else {
                throw JellycoreError.typeError(type: "FunctionCallNode", description: "Node type does not match struct type")
            }

            let results = try compileFunctionCall(node: coreNode, scope: scope)
            
            actions.append(contentsOf: results)
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
    
    private func compileFlag(node: FlagNode) throws -> [WFAction] {
        var actions: [WFAction] = []
        
        guard let flagNameValue = node.getFlagName(), let flagName = FlagName(rawValue: flagNameValue) else {
            throw JellycoreError.syntax(description: "Invalid Flag Name", recoveryStrategy: "Ensure that all of your flag's begin with # followed by either 'Icon' or 'Color'")
        }
        
        guard let flagValue = node.getFlagValue() else {
            throw JellycoreError.syntax(description: "Invalid Flag Value", recoveryStrategy: "Ensure that all of your flag's have a value. Value's should come after a flag's name in the format: #FlagName: FlagValue.")
        }
        
        switch flagName {
        case .color:
            if let color = ShortcutColor(rawValue: flagValue) {
                let action = WFAction(WFWorkflowActionIdentifier: "jelly.config.color", WFWorkflowActionParameters: ["VALUE": QuantumValue(color.id)])
                actions.append(action)
            } else {
                throw JellycoreError.syntax(description: "Invalid Flag Value", recoveryStrategy: "The value \(flagValue) is not a valid shortcut color name. Please look in the documentation for the list of available colors.")
            }
        case .icon:
            if let glyph = ShortcutGlyph(rawValue: flagValue) {
                let action = WFAction(WFWorkflowActionIdentifier: "jelly.config.icon", WFWorkflowActionParameters: ["VALUE": QuantumValue(glyph.id)])
                actions.append(action)
            } else {
                throw JellycoreError.syntax(description: "Invalid Flag Value", recoveryStrategy: "The value \(flagValue) is not a valid shortcut icon name. Please look in the documentation for the list of available icons.")
            }
        }
        
        return actions
    }
    
    private func compileMenu(node: MenuNode, scope: Scope) throws -> [WFAction] {
        var actions: [WFAction] = []
        
        if let prompt = node.prompt,
           let menuBody = node.body {
            let menuUUID = UUID().uuidString
            let menuItems: [String] = menuBody.caseNodes.compactMap({ $0.caseString?.content })
            
            let menuHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.choosefrommenu", WFWorkflowActionParameters: [
                "WFMenuPrompt": QuantumValue(prompt.content),
                "WFControlFlowMode": QuantumValue(0),
                "WFMenuItems": QuantumValue(menuItems),
                "GroupingIdentifier": QuantumValue(menuUUID)
            ])
            actions.append(menuHeadAction)
            
            // MARK: Compile each underlying case node
            for caseNode in menuBody.caseNodes {
                guard let caseTitle = caseNode.caseString?.content else { continue }
                let caseHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.choosefrommenu", WFWorkflowActionParameters: [
                    "WFMenuItemTitle": QuantumValue(caseTitle),
                    "WFControlFlowMode": QuantumValue(1),
                    "GroupingIdentifier": QuantumValue(menuUUID)
                ])
                actions.append(caseHeadAction)

                if let body = caseNode.body {
                    let compilationResults = compileBlock(root: body.rawValue, scope: scope)
                    actions.append(contentsOf: compilationResults)
                }
            }

            var menuTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(menuUUID)
            ]
            
            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scope.variables.append(magicVariable)
                
                menuTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let menuTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.choosefrommenu", WFWorkflowActionParameters: menuTailDictionary)
            actions.append(menuTailAction)
        }

        return actions
    }
    
    private func compileRepeatEach(node: RepeatEachNode, scope: Scope) throws -> [WFAction] {
        var actions: [WFAction] = []

        if let identifier = node.identifier,
           let variableReference = JellyVariableReference(identifierNode: identifier, scopedVariables: scope.variables) {
            let repeatUUID = UUID().uuidString
            
            let repeatHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.each", WFWorkflowActionParameters: [
                "WFControlFlowMode": QuantumValue(0),
                "WFInput": QuantumValue(variableReference),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ])

            actions.append(repeatHeadAction)

            if let body = node.body {
                let compilationResults = compileBlock(root: body.rawValue, scope: scope)
                actions.append(contentsOf: compilationResults)
                // TODO: Figure out how shortcuts handles variables within if statements
//                    scopedVariables.append(contentsOf: compilationResults.scope)
            }
            
            var repeatTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ]
            
            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scope.variables.append(magicVariable)
                
                repeatTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let repeatTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: repeatTailDictionary)

            actions.append(repeatTailAction)
        }
        
        return actions
    }

    private func compileRepeat(node: RepeatNode, scope: Scope) throws -> [WFAction] {
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
                let compilationResults = compileBlock(root: body.rawValue, scope: scope)
                actions.append(contentsOf: compilationResults)
                // TODO: Figure out how shortcuts handles variables within if statements
//                    scopedVariables.append(contentsOf: compilationResults.scope)
            }
            
            var repeatTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ]
            
            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scope.variables.append(magicVariable)
                
                repeatTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let repeatTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: repeatTailDictionary)

            actions.append(repeatTailAction)

        }
        
        return actions
    }
    
    private func compileConditional(node: ConditionalNode, scope: Scope) throws -> [WFAction] {
        var actions: [WFAction] = []

        if let primaryNode = node.primaryNode,
           let primaryVariableReference = JellyVariableReference(identifierNode: primaryNode, scopedVariables: scope.variables) {
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
                var inputTwo: QuantumValue = QuantumValue(JellyString(secondaryNode, scopedVariables: scope.variables))
                
                if secondaryNode.type == .number {
                    if let double = JellyDouble(secondaryNode, scopedVariables: scope.variables) {
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
                let compilationResults = compileBlock(root: body.rawValue, scope: scope)
                actions.append(contentsOf: compilationResults)
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
                    let compilationResults = compileBlock(root: body.rawValue, scope: scope)
                    actions.append(contentsOf: compilationResults)
                    // TODO: Figure out how shortcuts handles variables within if statements
    //                    scopedVariables.append(contentsOf: compilationResults.scope)
                }
            }

            // MARK: Compile Tail
            var conditionalTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(conditionalUUID)
            ]

            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scope.variables.append(magicVariable)
                
                conditionalTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let conditionalTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.conditional", WFWorkflowActionParameters: conditionalTailDictionary)

            actions.append(conditionalTailAction)

        } else {
            print("Unable to initialize due to invalid primary node")
        }
        
        return actions
    }
    
    private func compileVariableDeclaration(node: VariableAssignmentNode, scope: Scope) throws -> [WFAction] {
        // TODO: Check to make sure variable is available
        if Transpiler.globalVariables.contains(where: { variableNameMatches(variable: $0, name: node.name) }) {
            // TODO: Error Reporting
            return []
        }
        
        let existingVariable: Variable? = scope.variables.first(where: { variableNameMatches(variable: $0, name: node.name) })

        if let valuePrimitive = node.valuePrimitive {
            let nodeType = valuePrimitive.type
            var actions: [WFAction] = []
                        
            if nodeType == .string {
                let textUUID = UUID().uuidString
                let magicVariable = Variable(uuid: textUUID, name: "Generated Magic Variable \(textUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = TranspilerLookupTables.Library.shortcuts.functionTable["text"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "text", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scope.variables)
                    
                    actions.append(builtFunction)
                }
                
                
                let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scope.variables)), "WFVariableName": QuantumValue(node.name)])
                
                // Add the magic variable pointing to the string function to the scope
                scope.variables.append(magicVariable)
                if let existingVariable {
                    existingVariable.value = node.value
                    existingVariable.valueType = .string
                } else {
                    // Add the variable we just created to the scope
                    scope.variables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: .string, value: node.value))
                }
                actions.append(variableAction)
            } else if nodeType == .number {
                let numberUUID = UUID().uuidString
                let magicVariable = Variable(uuid: numberUUID, name: "Generated Magic Variable \(numberUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = TranspilerLookupTables.Library.shortcuts.functionTable["number"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "value", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scope.variables)
                    
                    actions.append(builtFunction)
                }
                
                
                let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scope.variables)), "WFVariableName": QuantumValue(node.name)])
                
                // Add the magic variable pointing to the string function to the scope
                scope.variables.append(magicVariable)

                if let existingVariable {
                    existingVariable.value = node.value
                    existingVariable.valueType = .number
                } else {
                    // Add the variable we just created to the scope
                    scope.variables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: .number, value: node.value))
                }
                
                actions.append(variableAction)
            } else {
                if let variableReference = JellyVariableReference(valuePrimitive, scopedVariables: scope.variables) {
                    let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(variableReference), "WFVariableName": QuantumValue(valuePrimitive.content)])
                    actions.append(variableAction)
                    
                    let type: Variable.ValueType = Transpiler.globalVariables.contains(where: {variableNameMatches(variable: $0, name: valuePrimitive.content)}) ? .global : .magicVariable
                    
                    if let existingVariable {
                        existingVariable.value = node.value
                        existingVariable.valueType = type
                    } else {
                        // Add the variable we just created to the scope
                        scope.variables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: type, value: node.value))
                    }
                }
            }

            return actions
        }

        return []
    }
    
    private func compileFunctionCall(node: FunctionCallNode, scope: Scope) throws -> [WFAction] {
        if let foundFunction = lookupTable[node.name.lowercased()] {
            var magicVariable: Variable? = nil
            if let magicVariableNode = node.magicVariable {
                magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: foundFunction)
                scope.variables.append(magicVariable!) // Variable has to initialize so it is okay to bang out the variable here
            }

            let builtFunction = foundFunction.build(call: node.parameters, magicVariable: magicVariable, scopedVariables: scope.variables)
            return [builtFunction]
        } else {
            // TODO: We have to handle custom user inputted functions
//            if let customFunction = userDefinedFunctions[node.content] {
////                            actions.append(customFunction.build)
//            } else {
//                ErrorReporter.shared.report(error: .functionNotFound(functionName: node.content), textPosition: node.textPosition)
//            }
        }
        return []
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
            case .menu:
                return MenuNode(sString: sString, content: content, rawValue: node)
            case .function:
                return FunctionDefinitionNode(sString: sString, content: content, rawValue: node)
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
