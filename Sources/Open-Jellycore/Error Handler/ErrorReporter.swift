//
//  ErrorReporter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

public class ErrorReporter {
    public var errors: [JellycoreError] = []
    
    public var numberOfErrors: Int {
        errors.filter({$0.level == .error || $0.level == .fatal || $0.level == .syntax}).count
    }
    
    public var numberOfWarnings: Int {
        errors.filter({$0.level == .warning}).count
    }
    
    public static let shared = ErrorReporter()
    
    private init() { }
    
    public func reset() {
        errors.removeAll()
    }
        
    func reportError(error: JellycoreError, node: CoreNode?) {
        error.relevantNode = node
        errors.append(error)
    }
    
    #if canImport(UIKit)
    public func getErrorText() -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        for error in errors {
            attributedString.append(error.getAttributedString())
        }
        
        print(attributedString)
        
        return attributedString
    }
    #endif
}
