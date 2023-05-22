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
        
        for child in children {
            try translateNodeFromTreeSitterNode(node: child)
        }
    }
}

// MARK: Parsing Helpers
/// Any functions that are directly helpful to parsing.
extension Parser {
    /// Translates a tree-sitter node into a Jellycore Node. This allows us to do our own processing on the nodes found by tree-sitter.
    private func translateNodeFromTreeSitterNode(node: TreeSitterNode) throws {
        if let type = node.type {
            guard let nodeType = ParserNodeType(rawValue: type) else {
                throw JellycoreError.invalidTreeSitterType(type: type)
            }
            
            switch nodeType {
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

/// These are analogous to the nodes defined in `grammar.js` in the `tree-sitter-jelly` package. They are used to pull parsed nodes directly from the tree sitter tree. Any new nodes added in `grammar.js` need to be added here
enum ParserNodeType: String {
    case flag = "flag"
    case `import` = "import"
    case `repeat` = "repeat_definition"
    case repeatEach = "repeat_each_definition"
    case conditional = "conditional_definition"
    case conditionalElse = "conditional_else"
    case `operator` = "operator"
    case menu = "menu_definition"
    case menuParameters = "menu_parameters"
    case menuBlock = "menu_block"
    case menuCase = "menu_case"
    case function = "function_definition"
    case macro = "macro_definition"
    case parameterList = "parameter_list"
    case statement = "statement"
    case variableDeclaration = "variable_declaration"
    case functionCall = "function_call"
    case magicVariable = "magic_variable_definition"
    case returnStatement = "return_statement"
    case identifier = "identifier"
    case number = "number"
    case array = "array"
    case string = "string"
    case multiString = "multi_line_string"
    case block = "block"
    case comment = "comment"
    case blockComment = "block_comment"
    case commentContent = "comment_content"
    case blockCommentContent = "block_comment_content"
}

protocol ParserNode {
    var type: ParserNodeType { get }
    var sString: String { get }
    var content: String { get }
    
    var rawValue: TreeSitterNode { get }
}

final class FlagNode: ParserNode {
    var type: ParserNodeType
    var sString: String
    var content: String
    var rawValue: TreeSitterNode
    
    init(sString: String, content: String, rawValue: TreeSitterNode) {
        self.type = .flag
        self.sString = sString
        self.content = content
        self.rawValue = rawValue
    }
}
