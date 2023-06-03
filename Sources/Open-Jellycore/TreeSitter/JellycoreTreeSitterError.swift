//
//  JellycoreTreeSitterError.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

/// An error originating from the Jellycore implementation of Tree Sitter.
enum JellycoreTreeSitterError: Error {
    case invalidPointer(type: String)
}
