//
//  Parser.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import TreeSitter
import TreeSitterJelly

/// The job of this class will be to watch the content for updates and accordingly update the underlying `TSTree` that is managed by tree-sitter
public final class Parser {
    let contents: String
    let treeSitterParser: OpaquePointer
    var tree: TreeSitterTree?
    
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
        tree = try TreeSitterTree(rawTreePtr: treePointer)
    }
}

// MARK: General Helpers
/// Any functions that are helpful to the operation of the parser, but not helpful to an end API user.
extension Parser {
    /// Get's the cString representation of a Swift String and returns it. Since this can fail, this basically wraps it in a throwable function.
    private func getCString() throws -> [CChar] {
        guard let cstr = contents.cString(using: .utf8) else {
            throw JellycoreError.unableToGetCString()
        }
        return cstr
    }
}
