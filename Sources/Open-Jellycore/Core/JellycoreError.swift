//
//  JellycoreError.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

enum JellycoreError: Error {
    case unableToGetCString
    case noParserTree
    case invalidTreeSitterType(type: String)
    case typeError(type: String, description: String)
    case invalidRoot
    case invalidContent(type: String, description: String)
}
