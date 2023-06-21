//
//  Compiler.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

/// The compiler that handles compiling Jelly code into Shortcuts code.
public final class Compiler {
    /// The default set of shortcuts variables
    static let globalVariables: [Variable] = [
        Variable(uuid: "", name: "ShortcutInput", valueType: .global, value: ""),
        Variable(uuid: "", name: "Clipboard", valueType: .global, value: ""),
        Variable(uuid: "", name: "CurrentDate", valueType: .global, value: ""),
        Variable(uuid: "", name: "Ask", valueType: .global, value: ""),
        Variable(uuid: "", name: "RepeatItem", valueType: .global, value: ""),
        Variable(uuid: "", name: "RepeatIndex", valueType: .global, value: ""),
        Variable(uuid: "", name: "DeviceDetails", valueType: .global, value: "")
    ]

    /// The contents that the compiler is parsing off of.
    var contents: String {
        return currentParser.contents
    }
    /// The current parser being used by the compiler
    var currentParser: Parser

    /// An initializer that provides the current parser to be used by the compiler.
    /// - Parameter parser: the parser that the compiler should use.
    public init(parser: Parser) {
        self.currentParser = parser
    }
    
    /// Compiles the syntax tree within `currentParser`.
    /// - Returns: Returns a compiled shortcut PLIST as a string.
    public func compile(named fileName: String) throws -> String {
        guard let tree = currentParser.tree else {
            throw JellycoreError.noParserTree()
        }
        
        let rootNode = tree.rootNode()
        guard rootNode.type == "source_file" else {
            throw JellycoreError.invalidRoot()
        }
        
        let scope = Scope(fileName: fileName)
        let actions = compileBlock(root: rootNode, scope: scope)
        let actionsWithFunctions = compileFunctions(for: scope, with: actions)
        
        var shortcut = WFShortcut()
        shortcut.WFWorkflowActions = actionsWithFunctions
        
        if let icon = shortcut.WFWorkflowActions.first(where: { action in
            return action.WFWorkflowActionIdentifier == "jelly.config.icon"
        }) {
            shortcut.WFWorkflowIcon.WFWorkflowIconGlyphNumber = icon.WFWorkflowActionParameters["VALUE"]?.value as? Int ?? ShortcutGlyph.shortcuts.id
            shortcut.WFWorkflowActions.removeAll { action in
                return action.WFWorkflowActionIdentifier == "jelly.config.icon"
            }
        }
        
        if let color = shortcut.WFWorkflowActions.first(where: { action in
            return action.WFWorkflowActionIdentifier == "jelly.config.color"
        }) {
            shortcut.WFWorkflowIcon.WFWorkflowIconStartColor = color.WFWorkflowActionParameters["VALUE"]?.value as? Int ?? ShortcutColor.red.id
            shortcut.WFWorkflowActions.removeAll { action in
                return action.WFWorkflowActionIdentifier == "jelly.config.color"
            }
        }
                
        let encodedShortcut = try encodeShortcut(shortcut: shortcut)
        
        return encodedShortcut
    }
    
    /// This function allows for compiling a Jelly file without converting it to a shortcut.
    /// This is useful for when the compiler needs to dispatch its own internal compilers to generate code.
    /// - Returns: The list of  ``WFAction``s that make up the compiled Jelly file.
    public func getCompiledActions(scope: Scope) throws -> [WFAction] {
        guard let tree = currentParser.tree else {
            throw JellycoreError.noParserTree()
        }
        
        let rootNode = tree.rootNode()
        guard rootNode.type == "source_file" else {
            throw JellycoreError.invalidRoot()
        }
        
        let actions = compileBlock(root: rootNode, scope: scope)

        return actions
    }
    
    /// Encodes a `WFShortcut` into a PLIST that can be saved as a .shortcut file.
    /// - Parameter shortcut: the shortcut that should be encoded
    /// - Returns: A PLIST representation of the  `shortcut`.
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
    
    /// Compiles a block of jelly code where all nodes are children of the `root` node.
    /// - Parameters:
    ///   - root: The root node to start compiling off of. Should preferably have some children.
    ///   - scope: The scope that the block has access too.
    /// - Returns: An array of `WFAction` that represents all of the compiled actions.
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
    
    /// Compiles a single `TreeSitterNode` into it's Shortcut's equivalents
    /// - Parameters:
    ///   - node: The tree sitter node to compile
    ///   - scope: The scope that the node has access too
    /// - Returns: An array of `WFAction` that represents all of the compiled actions that were retrieved from the `node`
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
            guard let coreNode = coreNode as? ImportNode else {
                throw JellycoreError.typeError(type: "ImportNode", description: "Node type does not match struct type")
            }
            if let libraryName = coreNode.getImportedLibrary(),
               let library = CompilerLookupTables.Library(rawValue: libraryName) {
                scope.addLibrary(library: library)
                print("Added library")
            }
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
            guard let coreNode = coreNode as? MacroDefinitionNode else  {
                throw JellycoreError.typeError(type: "FunctionDefinitionNode", description: "Node type does not match struct type")
            }
            
            guard !scope.macros.contains(where: { macro in
                return macro.name == coreNode.name
            }) else {
                throw JellycoreError.invalidMacroRedeclaration(name: coreNode.name)
            }
            
            scope.macros.append(coreNode)
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
        case .returnStatement:
            guard let coreNode = coreNode as? ReturnStatementNode else {
                throw JellycoreError.typeError(type: "ReturnStatementNode", description: "Node type does not match struct type")
            }
            
            let results = try compileReturn(node: coreNode, scope: scope)
            actions.append(contentsOf: results)
        default:
            print("Unhandled Node on Compile step \(coreNode.content) - \(coreNode.rawValue.string ?? "(empty)")")
            break
        }
        
        return actions
    }
}

// MARK: Transpile Individual Nodes
/// Any functions that compiler individual CoreNodes into Shortcuts Actions
extension Compiler {
    
    /// Compiles a ``ReturnStatementNode`` into a set of actions that represents a shortcuts exit shortcut value.
    /// - Parameters:
    ///   - node: The ``ReturnStatementNode`` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: An exit function and any needed primitive creation actions.
    private func compileReturn(node: ReturnStatementNode, scope: Scope) throws -> [WFAction] {
        var actions: [WFAction] = []

        if let valuePrimitive = node.valuePrimitive {
            if valuePrimitive.type == .string {
                let textUUID = UUID().uuidString
                let magicVariable = Variable(uuid: textUUID, name: "Generated Magic Variable \(textUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = CompilerLookupTables.Library.shortcuts.functionTable["text"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "text", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scope.variables)
                    
                    actions.append(builtFunction)
                }
                
                
                let exitAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.exit", WFWorkflowActionParameters: ["WFResult": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scope.variables))])
                
                // Add the magic variable pointing to the string function to the scope
                scope.variables.append(magicVariable)
                actions.append(exitAction)
            } else if valuePrimitive.type == .number {
                let numberUUID = UUID().uuidString
                let magicVariable = Variable(uuid: numberUUID, name: "Generated Magic Variable \(numberUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = CompilerLookupTables.Library.shortcuts.functionTable["number"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "value", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scope.variables)
                    
                    actions.append(builtFunction)
                }
                
                let exitAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.exit", WFWorkflowActionParameters: ["WFResult": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scope.variables))])

                // Add the magic variable pointing to the number function to the scope
                scope.variables.append(magicVariable)
                actions.append(exitAction)
            } else {
                if let identifierNode = valuePrimitive as? IdentifierNode,
                   let variableReference = JellyVariableReference(identifierNode: identifierNode, scopedVariables: scope.variables) {
                    let exitAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.exit", WFWorkflowActionParameters: ["WFResult": QuantumValue(variableReference)])

                    actions.append(exitAction)
                } else {
                    ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: valuePrimitive.content), node: valuePrimitive as? CoreNode)
                }
            }
        } else {
            throw JellycoreError.missingPrimitive(statement: "Return")
        }
        
        return []
    }
    
    /// Compiles a ``FlagNode`` into whatever flag it represents. Does not return normal Shortcuts actions.
    /// It returns Jellycuts config nodes that are removed later in transpiling.
    /// - Parameter node: The `FlagNode` that was found in the `compileNode` function.
    /// - Returns: The actions compiled from the Flag node.
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
    
    /// Compiles a `MenuNode` into a set of actions that represents a shortcuts menu.
    /// This function also handles all of the cases within a Menu so this function returns the menu and all of it's cases compiled.
    /// - Parameters:
    ///   - node: The `MenuNode` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: A menu node and all of the cases and their nodes included.
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
    
    /// Compiles a ``RepeatEachNode`` into a shortcuts repeat statement.
    /// - Parameters:
    ///   - node: The ``RepeatEachNode`` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: The compiled repeat node with all of it's internal nodes included.
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
                let repeatScope = Scope(parentScope: scope)
                repeatScope.createRepeatEachVariables()

                let compilationResults = compileBlock(root: body.rawValue, scope: repeatScope)
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
    
    /// Compiles a  `RepeatNode` into a shortcuts repeat statement
    /// - Parameters:
    ///   - node: The `RepeatNode` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: The repeat node and its internal block nodes
    private func compileRepeat(node: RepeatNode, scope: Scope) throws -> [WFAction] {
        var actions: [WFAction] = []

        if let amount = node.amount {
            let value = amount.getValue()
            let repeatUUID = UUID().uuidString
            
            let repeatHeadAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.repeat.count", WFWorkflowActionParameters: [
                "WFControlFlowMode": QuantumValue(0),
                "WFRepeatCount": QuantumValue(value ?? 0),
                "GroupingIdentifier": QuantumValue(repeatUUID)
            ])
            
            actions.append(repeatHeadAction)

            if let body = node.body {
                let repeatScope = Scope(parentScope: scope)
                repeatScope.createRepeatNumberVariables()
                
                let compilationResults = compileBlock(root: body.rawValue, scope: repeatScope)
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
    
    /// Compiles a `ConditionNode` into a shortcuts if statement and else statement if present
    /// - Parameters:
    ///   - node: The `ConditionalNode` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: The compiled node containing the shortcuts if statement, and else (if present) actions.
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
            throw JellycoreError.missingPrimitive(statement: "Conditional Primary Statement")
        }
        
        return actions
    }
    
    /// Compiles a `VariableAssignmentNode` into a shortcuts variable assignment.
    /// This function handles both creating variables with var syntax or set the value of a variable when the var keyword is not present.
    /// - Parameters:
    ///   - node: The `VariableAssignmentNode` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: The shortcuts variable assignment
    private func compileVariableDeclaration(node: VariableAssignmentNode, scope: Scope) throws -> [WFAction] {
        // TODO: Check to make sure variable is available
        if Compiler.globalVariables.contains(where: { variableNameMatches(variable: $0, name: node.name) }) {
            print("Failed to init because variable is global")
            throw JellycoreError.immutableVariable(name: node.name)
        }
        
        let existingVariable: Variable? = scope.variables.first(where: { variableNameMatches(variable: $0, name: node.name) })

        if let valuePrimitive = node.valuePrimitive {
            let nodeType = valuePrimitive.type
            var actions: [WFAction] = []
                        
            if nodeType == .string {
                let textUUID = UUID().uuidString
                let magicVariable = Variable(uuid: textUUID, name: "Generated Magic Variable \(textUUID)", valueType: .magicVariable, value: "Text")
                
                if let foundFunction = CompilerLookupTables.Library.shortcuts.functionTable["text"] {
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
                
                if let foundFunction = CompilerLookupTables.Library.shortcuts.functionTable["number"] {
                    let call: [FunctionCallParameterItem] = [
                        FunctionCallParameterItem(slotName: "value", item: valuePrimitive)
                    ]
                    let builtFunction = foundFunction.build(call: call, magicVariable: magicVariable, scopedVariables: scope.variables)
                    
                    actions.append(builtFunction)
                }
                
                
                let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(JellyVariableReference(magicVariable, scopedVariables: scope.variables)), "WFVariableName": QuantumValue(node.name)])
                
                // Add the magic variable pointing to the number function to the scope
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
                if let identifierNode = valuePrimitive as? IdentifierNode,
                   let variableReference = JellyVariableReference(identifierNode: identifierNode, scopedVariables: scope.variables) {
                    let variableAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.setvariable", WFWorkflowActionParameters: ["WFInput": QuantumValue(variableReference), "WFVariableName": QuantumValue(node.name)])
                    actions.append(variableAction)
                    
                    let type: Variable.ValueType = Compiler.globalVariables.contains(where: { variableNameMatches(variable: $0, name: valuePrimitive.content)} ) ? .global : .magicVariable
                    
                    if let existingVariable {
                        existingVariable.value = node.value
                        existingVariable.valueType = type
                    } else {
                        // Add the variable we just created to the scope
                        scope.variables.append(Variable(uuid: UUID().uuidString, name: node.name, valueType: type, value: node.value))
                    }
                } else {
                    ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: valuePrimitive.content), node: valuePrimitive as? CoreNode)
                }
            }

            return actions
        } else {
            throw JellycoreError.missingPrimitive(statement: "Variable declaration")
        }
    }
    
    /// Compiles a function call into it's given shortcut equivalent.
    /// When the function called is from Shortcuts or an installed app that integrates with Shortcuts the function is directly added from the lookup table.
    /// When the function called is user defined function or macro, it is added to the scope. Macros are automatically inserted into the actions returned. Functions are dealt with later in compilation as it requires reorganizing the entire shortcut structure
    /// - Parameters:
    ///   - node: The `FunctionCallNode` that was found in the `compileNode` function.
    ///   - scope: The scope available to the node.
    /// - Returns: The actions that make up the function that was called.
    private func compileFunctionCall(node: FunctionCallNode, scope: Scope) throws -> [WFAction] {
        var magicVariable: Variable? = nil

        if let foundFunction = scope.lookupTable[node.name] {
            if let magicVariableNode = node.magicVariable {
                magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: foundFunction)
                scope.variables.append(magicVariable!) // Variable has to initialize so it is okay to bang out the variable here
            }
            
            let builtFunction = foundFunction.build(call: node.parameters, magicVariable: magicVariable, scopedVariables: scope.variables)
            return [builtFunction]
        } else {
            if let customFunction = scope.functions.first(where: { function in
                return function.name == node.name
            }) {
                if let magicVariableNode = node.magicVariable {
                    magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: customFunction)
                    scope.variables.append(magicVariable!) // Variable has to initialize so it is okay to bang out the variable here
                }

                return try customFunction.build(call: node.parameters, magicVariable: magicVariable, scope: scope)
            } else if let customMacro = scope.macros.first(where: { macro in
                return macro.name == node.name
            }) {
                if let magicVariableNode = node.magicVariable {
                    magicVariable = Variable(uuid: UUID().uuidString, name: magicVariableNode.identifier?.content ?? "No Name", valueType: .magicVariable, value: customMacro)
                    scope.variables.append(magicVariable!) // Variable has to initialize so it is okay to bang out the variable here
                }
                
                if let body = customMacro.body {
                    var actions = compileBlock(root: body.rawValue, scope: scope)
                    
                    let headerText = """
                    ====
                    Start \(customMacro.name) Macro
                    ====
                    """
        
                    let footerText = """
                    ====
                    End \(customMacro.name) Macro
                    ====
                    """
        
                    let headerComment: WFAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.comment", WFWorkflowActionParameters: ["WFCommentActionText": QuantumValue(headerText)])

                    let footerComment: WFAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.comment", WFWorkflowActionParameters: ["WFCommentActionText": QuantumValue(footerText)])

                    actions.insert(headerComment, at: 0)
                    actions.append(footerComment)
                    
                    return actions
                }
            } else {
                ErrorReporter.shared.reportError(error: .undefinedFunction(name: node.name), node: node)
            }
        }
        return []
    }
    
    /// Compiles a `CommentNode` into a Shortcuts comment
    /// - Parameter node: The comment node
    /// - Returns: The action that makes up the comment.
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
extension Compiler {
    /// Translates a basic `TreeSitterNode` into it's Core Node representation that is used by Jelly
    /// - Parameter node: The node that needs to be translated
    /// - Returns: A translated node, if one is possible. If not it will return nil.
    private func translateNodeFromTreeSitterNode(node: TreeSitterNode) throws -> CoreNode? {
        if let type = node.type {
            guard let nodeType = CoreNodeType(rawValue: type) else {
                // TODO: Fix the grammar so this hack is not needed for empty if statements.
                if type != "{" && type != "}" {
                    throw JellycoreError.invalidTreeSitterType(type: type)
                } else {
                    return nil
                }
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
            case .macro:
                return MacroDefinitionNode(sString: sString, content: content, rawValue: node)
            case .returnStatement:
                return ReturnStatementNode(sString: sString, content: content, rawValue: node)
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

// MARK: Function Handlers
/// Any functions that are related to compiling functions.
extension Compiler {
    private func compileFunctions(for scope: Scope, with actions: [WFAction]) -> [WFAction] {
        var actions: [WFAction] = actions
        
        // If we do not have any functions just return the current actions
        if scope.functions.isEmpty { return actions }
        
        let functionScope = Scope(fileName: scope.fileName)

        do {
            let variableResults = try createFunctionsGlobalVariable(scope: functionScope)
            let variableActions = variableResults.actions

            let globalFunctionDispatchVariableName = variableResults.variableName
            
            for function in scope.functions {
                guard let body = function.body else {
                    throw JellycoreError.generic(description: "No function body was found", recoveryStrategy: "Please make sure all of your functions are properly typed.", level: .fatal)
                }

                // Make an if statement for us to harvest it's compiled actions. These will be used for routing the function call.
                let functionDispatchIfStatement = """
                if \(globalFunctionDispatchVariableName).as(String) == "\(function.name)" {

                } else {

                }
                """
 
                let internalParser = Parser(contents: functionDispatchIfStatement)
                try internalParser.parse()
                let internalCompiler = Compiler(parser: internalParser)
                let functionIfStatementActions = try internalCompiler.getCompiledActions(scope: functionScope)
                
                guard functionIfStatementActions.count == 3 else {
                    throw JellycoreError.generic(description: "An invalid number of actions was returned while creating function routing.", recoveryStrategy: "Please make sure there are no syntax errors in the Jelly document.", level: .fatal)
                }
                
                let conditionalHeadAction = functionIfStatementActions[0]
                let conditionalElseAction = functionIfStatementActions[1]
                let conditionalTailAction = functionIfStatementActions[2]
                
                var functionActions = compileBlock(root: body.rawValue, scope: Scope(fileName: scope.fileName))

                let headerText = """
                ====
                Start \(function.name) Function)
                ====
                """
    
                let footerText = """
                ====
                End \(function.name) Function
                ====
                """
    
                let headerComment: WFAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.comment", WFWorkflowActionParameters: ["WFCommentActionText": QuantumValue(headerText)])

                let footerComment: WFAction = WFAction(WFWorkflowActionIdentifier: "is.workflow.actions.comment", WFWorkflowActionParameters: ["WFCommentActionText": QuantumValue(footerText)])

                functionActions.insert(headerComment, at: 0)
                functionActions.append(footerComment)
                
                // Insert the head of the if statement as the very first action
                actions.insert(conditionalHeadAction, at: 0)
                // Insert the else action right after that.
                actions.insert(conditionalElseAction, at: 2)
                // Then insert all of the body actions right before the else action. This allows us to just not count the body actions.
                actions.insert(contentsOf: functionActions, at: 2)
                // Append the end to the very end of all of the actions
                actions.append(conditionalTailAction)
            }
            
            // We have to insert the variable last so it will always be the first action
            actions.insert(contentsOf: variableActions, at: 0)
        } catch let error as JellycoreError {
            ErrorReporter.shared.reportError(error: error, node: nil)
        }  catch {
            ErrorReporter.shared.reportError(error: .generic(description: error.localizedDescription, recoveryStrategy: "Contact the developer", level: .fatal), node: nil)
        }
        
        return actions
    }
    
    private func createFunctionsGlobalVariable(scope: Scope) throws -> (actions: [WFAction], variableName: String) {
        let globalFunctionDispatchVariableUUID = UUID().uuidString
        let globalFunctionDispatchVariableName = "function-dispatch-\(globalFunctionDispatchVariableUUID)"
        let globalFunctionDispatchVariableCode = "var \(globalFunctionDispatchVariableName) = ShortcutInput.as(Dictionary).key(FUNCTION_CALL_NAME)"
    
        let internalParser = Parser(contents: globalFunctionDispatchVariableCode)
        try internalParser.parse()
        let internalCompiler = Compiler(parser: internalParser)
        
        let variableActions = try internalCompiler.getCompiledActions(scope: scope)
        
        return (variableActions, globalFunctionDispatchVariableName)
        
    }

}

// MARK: Filters and Array searches
extension Compiler {
    /// A connivence function used in searching to make it more compact. Just checks whether a variable name is equal to the given name.
    /// - Parameters:
    ///   - variable: The variable to check
    ///   - name: The name to check against
    /// - Returns: Boolean whether or not the variable name matches.
    private func variableNameMatches(variable: Variable, name: String) -> Bool {
        return variable.name == name
    }
}
 
