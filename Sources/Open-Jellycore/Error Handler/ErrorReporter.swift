//
//  ErrorReporter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/22/23.
//

import Foundation

/// The error reporter used by the Jelly compiler to report any errors throughout compilation.
public class ErrorReporter {
    /// A list of errors that occurred throughout compilation.
    public var errors: [JellycoreError] = []
    
    /// A calculated variable that counts the number of errors present in ``ErrorReporter/errors``
    public var numberOfErrors: Int {
        errors.filter({$0.level == .error || $0.level == .fatal || $0.level == .syntax}).count
    }
    
    /// A calculated variable that counts the number of warnings present in ``ErrorReporter/errors``
    public var numberOfWarnings: Int {
        errors.filter({$0.level == .warning}).count
    }
    
    /// The shared instance of this class. Used to ensure that it is accessible from anywhere in the compiler.
    public static let shared = ErrorReporter()
    
    /// A private initializer so that outside API user's can not initialize second copies.
    private init() { }
    
    /// A function that reset's the error reporter. This should be called after all errors present in ``ErrorReporter/errors`` have been displayed to the user. Usually called right before parsing and compiling is started.
    public func reset() {
        errors.removeAll()
    }
     
    
    /// /// A function that adds the given ``JellycoreError`` into the ``ErrorReporter/errors`` list, as well as assigning the given node to it's relevant node value.
    /// - Parameters:
    ///   - error: The error to add to the ``ErrorReporter/errors`` list
    ///   - node: The optional ``CoreNode`` to add as the `relevantNode` value in the error.
    func reportError(error: JellycoreError, node: CoreNode?) {
        error.relevantNode = node
        errors.append(error)
    }
    
    #if canImport(UIKit)
    /// Constructs an `NSAttributedString` representing the given errors present in the ``ErrorReporter/errors`` list. This is only available when UIKit is available
    /// - Returns: The  constructed`NSAttributedString`
    public func getErrorText() -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        for error in errors {
            attributedString.append(error.getAttributedString())
        }
                
        return attributedString
    }
    #endif
}
