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
        
        let results = compileBlock(root: rootNode, variableScope: [])
        
        print("Got \(results.scope.count) Variables - \(results.scope.map({$0.name}))")
        print("Got \(results.actions.count) Actions - \(results.actions)")
        
        var shortcut = WFShortcut()
        shortcut.WFWorkflowActions = results.actions
        
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

    private func compileBlock(root: TreeSitterNode, variableScope: [Variable]) -> (actions: [WFAction], scope: [Variable]){
        var shortcutsActions: [WFAction] = []
        var variableScope: [Variable] = variableScope

        for child in root.getChildren() {
            do {
                let results = try compileNode(node: child, scope: variableScope)
                
                shortcutsActions.append(contentsOf: results.actions)
                variableScope = results.scope
            } catch let error as JellycoreError {
                ErrorReporter.shared.reportError(error: error, node: nil)
            }  catch {
                ErrorReporter.shared.reportError(error: .generic(description: error.localizedDescription, recoveryStrategy: "Contact the developer", level: .fatal), node: nil)
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
            guard let coreNode = coreNode as? FlagNode else {
                throw JellycoreError.typeError(type: "FlagNode", description: "Node typue does not match struct type")
            }
            let flagActions = try compileFlag(node: coreNode)
            actions.append(contentsOf: flagActions)
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
            guard let coreNode = coreNode as? MenuNode else {
                throw JellycoreError.typeError(type: "MenuNode", description: "Node type does not match struct type")
            }

            let results = try compileMenu(node: coreNode, scopedVariables: scope)
            
            actions.append(contentsOf: results.actions)
            scope = results.variables
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

            let functionCallResults = try compileFunctionCall(node: coreNode, scopedVariables: scope)
            
            actions.append(contentsOf: functionCallResults.actions)
            scope = functionCallResults.variables
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
    
    private func compileFlag(node: FlagNode) throws -> [WFAction] {
        var actions: [WFAction] = []
        print(node.getFlagName(), node.getFlagValue())
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
    
    private func compileMenu(node: MenuNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        var scopedVariables: [Variable] = scopedVariables
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
                    let compilationResults = compileBlock(root: body.rawValue, variableScope: scopedVariables)
                    actions.append(contentsOf: compilationResults.actions)
                }
            }

            var menuTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(menuUUID)
            ]
            
            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scopedVariables.append(magicVariable)
                
                menuTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let menuTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.choosefrommenu", WFWorkflowActionParameters: menuTailDictionary)
            actions.append(menuTailAction)
        }

        return (actions, scopedVariables)
    }
    
    private func compileRepeatEach(node: RepeatEachNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        var scopedVariables: [Variable] = scopedVariables
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
            
            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scopedVariables.append(magicVariable)
                
                repeatTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let repeatTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: repeatTailDictionary)

            actions.append(repeatTailAction)
        }
        
        return (actions, scopedVariables)
    }

    private func compileRepeat(node: RepeatNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        var scopedVariables: [Variable] = scopedVariables
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
            
            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scopedVariables.append(magicVariable)
                
                repeatTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

            let repeatTailAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: repeatTailDictionary)

            actions.append(repeatTailAction)

        }
        
        return (actions, scopedVariables)
    }
    
    private func compileConditional(node: ConditionalNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        var scopedVariables: [Variable] = scopedVariables
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
            var conditionalTailDictionary: [String: QuantumValue] = [
                "WFControlFlowMode": QuantumValue(2),
                "GroupingIdentifier": QuantumValue(conditionalUUID)
            ]

            if let magicVariableNode = node.magicVariable {
                let magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: actions.last)
                scopedVariables.append(magicVariable)
                
                conditionalTailDictionary.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                    return first
                }
            }

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
    
    private func compileFunctionCall(node: FunctionCallNode, scopedVariables: [Variable]) throws -> (actions: [WFAction], variables: [Variable]) {
        var scopedVariables: [Variable] = scopedVariables

        if let foundFunction = lookupTable[node.name.lowercased()] {
            var magicVariable: Variable? = nil
            if let magicVariableNode = node.magicVariable {
                magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: foundFunction)
                scopedVariables.append(magicVariable!) // Variable has to initialize so it is okay to bang out the variable here
            }

            let builtFunction = foundFunction.build(call: node.parameters, magicVariable: magicVariable, scopedVariables: scopedVariables)
            return ([builtFunction], scopedVariables)
        } else {
            // TODO: We have to handle custom user inputted functions
//            if let customFunction = userDefinedFunctions[node.content] {
////                            actions.append(customFunction.build)
//            } else {
//                ErrorReporter.shared.report(error: .functionNotFound(functionName: node.content), textPosition: node.textPosition)
//            }
        }
        return ([], scopedVariables)
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
