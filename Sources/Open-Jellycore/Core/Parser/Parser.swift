//
//  Parser.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import TreeSitter
import TreeSitterJelly

public final class Parser {
    let contents: String
    let treeSitterParser: OpaquePointer
    
    init(contents: String) {
        self.contents = contents
        let jelly = tree_sitter_jelly()
        treeSitterParser = ts_parser_new()
        ts_parser_set_language(treeSitterParser, jelly)
    }
    
    func parse() throws {
        let cstr = try getCString()
        let stringByteLength = contents.count
        let buffer = Array(cstr)
        
        let treePointer: OpaquePointer? = ts_parser_parse_string_encoding(treeSitterParser, nil, buffer, UInt32(stringByteLength), TSInputEncodingUTF8)
        let tree = try TreeSitterTree(rawTreePtr: treePointer)
        let rootNode = tree.rootNode()
        let children = rootNode.getChildren()
        
        var parsedNodes: [any ParserNode] = []
        
        for child in children {
            if let node = try translateNodeFromTreeSitterNode(node: child) {
                parsedNodes.append(node)
            }
        }
        
        print(parsedNodes, parsedNodes.count)
    }
}

// MARK: Parsing Helpers
/// Any functions that are directly helpful to parsing.
extension Parser {
    /// Translates a tree-sitter node into a Jellycore Node. This allows us to do our own processing on the nodes found by tree-sitter.
    private func translateNodeFromTreeSitterNode(node: TreeSitterNode) throws -> ParserNode? {
        if let type = node.type {
            guard let nodeType = ParserNodeType(rawValue: type) else {
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
            case .statement:
                // TODO: Implement Statement Nodes
                break
            case .variableDeclaration:
                // TODO: Implement Variable Declaration Nodes
                break
            case .functionCall:
                // TODO: Implement Function Call Nodes
                break
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
            case .comment:
                // TODO: Implement Comment Nodes
                break
            case .blockComment:
                // TODO: Implement Block Comment Nodes
                break
            case .commentContent:
                // TODO: Implement Comment Nodes
                break
            case .blockCommentContent:
                // TODO: Implement Block Comment Nodes
                break
            }
        } else {
            print("Child with no type found \(node.string ?? "No String Either")")
        }
        
        return nil
    }
}

// MARK: General Helpers
/// Any functions that are helpful to the operation of the parser, but not helpful to an end API user.
extension Parser {
    /// Get's the cString representation of a Swift String and returns it. Since this can fail, this basically wraps it in a throwable function.
    private func getCString() throws -> [CChar] {
        guard let cstr = contents.cString(using: .utf8) else {
            throw JellycoreError.unableToGetCString
        }
        return cstr
    }
}
