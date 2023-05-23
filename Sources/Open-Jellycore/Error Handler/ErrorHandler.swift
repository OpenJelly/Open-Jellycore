//
//  ErrorHandler.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

class ErrorHandler {
    var errors: [JellycoreError] = []
    
    static let shared = ErrorHandler()
    
    private init() { }
    
    func reset() {
        errors.removeAll()
    }
        
    func reportError(error: JellycoreError, node: CoreNode?) {
        error.relevantNode = node
        errors.append(error)
    }
}
