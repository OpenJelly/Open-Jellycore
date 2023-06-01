//
//  ErrorReporter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

public class ErrorReporter {
    public var errors: [JellycoreError] = []
    
    public static let shared = ErrorReporter()
    
    private init() { }
    
    public func reset() {
        errors.removeAll()
    }
        
    func reportError(error: JellycoreError, node: CoreNode?) {
        error.relevantNode = node
        errors.append(error)
    }
}
