//
//  Transpiler.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

class Transpiler {
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
                let actions = try compileNode(node: child)
                shortcutsActions.append(contentsOf: actions)
            } catch {
                print("Error Compiling node \(child.string ?? "No String") - \(error)")
            }
        }
        
        print("Got \(shortcutsActions.count) Actions - \(shortcutsActions)")
    }
    
    func compileNode(node: TreeSitterNode) throws -> [WFAction] {
        let coreNode = try translateNodeFromTreeSitterNode(node: node)
        guard let coreNode else { print("Unable to get core node - \(node.type ?? "No Type")"); return [] }
        var actions: [WFAction] = []
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
        case .operator:
            // TODO: Implement Conditional Nodes
            break
        case .menu:
            // TODO: Implement Menu Nodes
            break
        case .menuParameters:
            // TODO: Implement Menu Nodes
            break
        case .menuBlock:
            // TODO: Implement Menu Nodes
            break
        case .menuCase:
            // TODO: Implement Menu Nodes
            break
        case .function:
            // TODO: Implement Function Nodes
            break
        case .macro:
            // TODO: Implement Macro Nodes
            break
        case .parameterList:
            // TODO: Implement Parameter List Nodes
            break
        case .parameterListItem:
            // TODO: Implement Parameter List Nodes
            break
        case .statement:
            // TODO: Implement Statement Nodes
            break
        case .variableDeclaration:
            // TODO: Implement Variable Declaration Nodes
            break
        case .functionCall:
            guard let coreNode = coreNode as? FunctionCallNode else {
                throw JellycoreError.typeError(type: "FunctionCallNode", description: "Node type does not match struct type")
            }

            if let functionCallAction = try compileFunctionCall(node: coreNode) {
                actions.append(functionCallAction)
            } else {
                print("Unable to generate action")
            }
        case .magicVariable:
            // TODO: Implement Magic Variable Nodes
            break
        case .returnStatement:
            // TODO: Implement Return Nodes
            break
        case .identifier:
            // TODO: Implement Identifier Nodes
            break
        case .number:
            // TODO: Implement Number Nodes
            break
        case .array:
            // TODO: Implement Array Nodes
            break
        case .string:
            // TODO: Implement String Nodes
            break
        case .multiString:
            // TODO: Implement Multi String Nodes
            break
        case .block:
            // TODO: Implement Block Nodes
            break
        case .comment, .blockComment:
            guard let coreNode = coreNode as? CommentNode else {
                throw JellycoreError.typeError(type: "Comment", description: "Node type does not match struct type")
            }
            
            let commentAction = try compileComment(node: coreNode)
            actions.append(commentAction)
        }
        
        return actions
    }
}

// MARK: Transpile Individual Nodes
/// Any functions that transpiler individual CoreNodes into Shortcuts Actions
extension Transpiler {
    private func compileFunctionCall(node: FunctionCallNode) throws -> WFAction? {
        if let foundFunction = lookupTable[node.name.lowercased()] {
            let builtFunction = foundFunction.build(call: node, magicVariable: nil, scopedVariables: [])
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
            case .operator:
                // TODO: Implement Conditional Nodes
                break
            case .menu:
                // TODO: Implement Menu Nodes
                break
            case .menuParameters:
                // TODO: Implement Menu Nodes
                break
            case .menuBlock:
                // TODO: Implement Menu Nodes
                break
            case .menuCase:
                // TODO: Implement Menu Nodes
                break
            case .function:
                // TODO: Implement Function Nodes
                break
            case .macro:
                // TODO: Implement Macro Nodes
                break
            case .parameterList:
                // TODO: Implement Parameter List Nodes
                break
            case .parameterListItem:
                // TODO: Implement Parameter List Nodes
                break
            case .statement:
                // TODO: Implement Statement Nodes
                break
            case .variableDeclaration:
                // TODO: Implement Variable Declaration Nodes
                break
            case .functionCall:
                return FunctionCallNode(sString: sString, content: content, rawValue: node)
            case .magicVariable:
                // TODO: Implement Magic Variable Nodes
                break
            case .returnStatement:
                // TODO: Implement Return Nodes
                break
            case .identifier:
                // TODO: Implement Identifier Nodes
                break
            case .number:
                // TODO: Implement Number Nodes
                break
            case .array:
                // TODO: Implement Array Nodes
                break
            case .string:
                // TODO: Implement String Nodes
                break
            case .multiString:
                // TODO: Implement Multi String Nodes
                break
            case .block:
                // TODO: Implement Block Nodes
                break
            case .comment, .blockComment:
                return CommentNode(sString: sString, content: content, rawValue: node)
            }
        } else {
            print("Child with no type found \(node.string ?? "No String Either")")
        }
        
        return nil
    }
}
