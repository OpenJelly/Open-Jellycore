//
//  JellycoreError.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

enum JellycoreError: Error {
    case unableToGetCString
    case invalidTreeSitterType(type: String)
}
