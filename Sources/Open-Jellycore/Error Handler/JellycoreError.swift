//
//  JellycoreError.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// A swift `LocalizedError` that represents an error that has occurred in Jellycore. This class wraps the internal ``JellycoreUnderlyingError`` and ads extra functionality that an enumeration can not handle.
public class JellycoreError: LocalizedError, Identifiable {
    /// A unique identifier for the Error.
    public var id: UUID = UUID()
    
    /// The level of severity of the error.
    enum Level {
        case syntax
        case warning
        case error
        case fatal
    }

    /// The underlying error enumeration used for storing and creating the descriptions of individual errors.
    public enum JellycoreUnderlyingError: CustomStringConvertible {
        /// This error is raised when Jellycore is not able to convert a swift string into a list of `CChar`
        case unableToGetCString
        /// This error is raised when there is no parser tree available to the compiler.
        case noParserTree
        /// This error is raised when during compilation one of the Core Nodes has an incorrect tree sitter type set for the ``CoreNode/type`` property.
        case invalidTreeSitterType(type: String)
        /// This error is raised when a Jelly type such as a Boolean or Date can not be extracted from the node that was provided to them for initialization.
        case typeError(type: String, description: String)
        /// This error is raised when the Jelly source file does not have a root node on the start of compilation
        case invalidRoot
        /// This error is raised when a Jelly type can not find the correct node content.
        case invalidContent(type: String, description: String)
        /// This error is raised when a parameter does not include a name. Parameters without names are no longer supported in Jelly.
        case missingParameterName(function: String, name: String)
        /// This error is used as a warning, and is raised when a function is missing a parameter.
        case missingParameter(function: String, name: String)
        /// This error is raised when a variable that the user uses has not been initialized anywhere else in the Jelly file.
        case variableDoesNotExist(variable: String)
        /// This error is raised when an invalid type coercion is detected.
        case invalidTypeCoercion(type: String)
        /// This error is raised when Swift's `JSONSerialization` is unable to parse user provided JSON
        case unableToParseJSON(jsonError: Error)
        /// This error is raised when an action or other `Codable` part of the final ``WFShortcut`` is not encodable.
        case unableToEncode(identifier: String)
        /// This error is raised when a user declares a function with the same name more than once.
        case invalidFunctionRedeclaration(name: String)
        /// This error is raised when a user declares a macro with the same name more than once.
        case invalidMacroRedeclaration(name: String)
        /// This error is raised when a user calls a function that has not been defined in the scope.
        case undefinedFunction(name: String)
        /// This is a generic error that is used across Jellycore for issues that do not require their own case in this enumeration.
        case generic
        
        /// The description of the error
        public var description: String {
            switch self {
            case .unableToGetCString:
                return "Unable to create a CString from the input file."
            case .noParserTree:
                return "Unable to get a starting parser tree."
            case .invalidTreeSitterType(let type):
                return "Invalid Tree Sitter Type \(type)."
            case .typeError(let type, let description):
                return "Type Error \(type) - \(description)."
            case .invalidRoot:
                return "Invalid Root Node,"
            case .invalidContent(let type, let description):
                return "Invalid Content for type (\(type)) - \(description)."
            case .generic:
                return "Generic Error."
            case .missingParameterName(let function, let name):
                return "Missing parameter name: \(name) in \(function)."
            case .missingParameter(let function, let name):
                return "Missing parameter \(name) in \(function)."
            case .variableDoesNotExist(let variable):
                return "Variable \(variable) does not exist."
            case .invalidTypeCoercion(let type):
                return "\(type) is not a valid 'as' coercion."
            case .unableToParseJSON(let jsonError):
                return "Invalid JSON, underlying error \(jsonError.localizedDescription)"
            case .unableToEncode(let identifier):
                return "Unable to encode \(identifier)."
            case .invalidFunctionRedeclaration(let name):
                return "The function \(name) was declared multiple times. Functions require unique names."
            case .invalidMacroRedeclaration(let name):
                return "The macro \(name) was declared multiple times. Macros require unique names."
            case .undefinedFunction(let name):
                return "The function or macro \(name) has not been defined in the scope."
            }
        }
    }
    
    /// The underlying error enumeration that this error represents
    var underlyingError: JellycoreUnderlyingError
    /// An optional relevant node that can be used to point the user towards the error.
    var relevantNode: CoreNode? = nil
    /// The severity level of this error.
    var level: JellycoreError.Level
    /// A recovery strategy that is presented to the user. This strategy should instruct the user on how to fix the issue.
    var recoveryStrategy: String
    /// The description of what the error is.
    var description: String

    /// `LocalizedErrors`s recoverySuggestion, which is analogous to `recoveryStrategy`
    public var recoverySuggestion: String? {
        return recoveryStrategy
    }
    
    /// `LocalizedErrors`s recoverySuggestion, which is analogous to `description`
    public var errorDescription: String? {
        return description
    }
    
    
    /// An initializer that takes the error description from the ``JellycoreUnderlyingError``.
    /// - Parameters:
    ///   - underlyingError: The ``JellycoreUnderlyingError`` that this error is wrapping.
    ///   - relevantNode: The possible relevant node for this error.
    ///   - level: The level of severity of this error.
    ///   - recoveryStrategy: A recovery strategy for the user to use for trouble shooting.
    init(underlyingError: JellycoreUnderlyingError, relevantNode: CoreNode? = nil, level: JellycoreError.Level, recoveryStrategy: String) {
        self.underlyingError = underlyingError
        self.relevantNode = relevantNode
        self.level = level
        self.recoveryStrategy = recoveryStrategy
        self.description = underlyingError.description
    }
    
    /// An initializer that allows for a custom error description not taken from the ``JellycoreUnderlyingError``
    /// - Parameters:
    ///   - underlyingError: The ``JellycoreUnderlyingError`` that this error is wrapping.
    ///   - relevantNode: The possible relevant node for this error.
    ///   - level: The level of severity of this error.
    ///   - description: A description of what the error is so the user can understand the issue.
    ///   - recoveryStrategy: A recovery strategy for the user to use for trouble shooting.
    init(underlyingError: JellycoreUnderlyingError, relevantNode: CoreNode? = nil, level: JellycoreError.Level, description: String, recoveryStrategy: String) {
        self.underlyingError = underlyingError
        self.relevantNode = relevantNode
        self.level = level
        self.recoveryStrategy = recoveryStrategy
        self.description = description
    }

#if canImport(UIKit)
    /// Constructs an `NSAttributedString` that represents this error. Used by ``ErrorReporter/getErrorText()``. This is only available when UIKit is available
    /// - Returns: An `NSAttributedString` that represents this error.
    func getAttributedString() -> NSAttributedString {
        guard let errorDescription else { return NSAttributedString() }
        
        let attrString = NSMutableAttributedString(string: "\(errorDescription)\n - \(recoveryStrategy)\n")
        switch self.level {
        case .syntax, .error, .fatal:
            attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed, range: attrString.string.range)
        case .warning:
            attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemOrange, range: attrString.string.range)
        }
        
        return attrString
    }
    #endif
}

// MARK: Static Constructors
// Basically an error factory that allows for dot initialization of errors.
extension JellycoreError {
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/unableToGetCString`` underlying error.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func unableToGetCString() -> JellycoreError {
        return JellycoreError(underlyingError: .unableToGetCString, level: .fatal, recoveryStrategy: "Please check your document's encoding format. Ensure that it is encoded in UTF-8.")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/noParserTree`` underlying error.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func noParserTree() -> JellycoreError {
        return JellycoreError(underlyingError: .noParserTree, level: .fatal, recoveryStrategy: "Please ensure that your document contains valid Jelly code.")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/invalidTreeSitterType(type:)`` underlying error.
    /// - Parameter type: The type that caused the issue.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func invalidTreeSitterType(type: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidTreeSitterType(type: type), level: .fatal, recoveryStrategy: "Check if CoreNodeTypes match the type present in the Jelly grammar.")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/typeError(type:description:)`` underlying error.
    /// - Parameters:
    ///   - type: The type that is not accurate or having issues.
    ///   - description: The description of why this type error occurred.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func typeError(type: String, description: String) -> JellycoreError {
        return JellycoreError(underlyingError: .typeError(type: type, description: description), level: .error, recoveryStrategy: "Make sure the type is accurate for the input")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/invalidRoot`` underlying error.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func invalidRoot() -> JellycoreError {
        return JellycoreError(underlyingError: .invalidRoot, level: .fatal, recoveryStrategy: "Make sure your file contain's valid Jelly code")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/invalidContent(type:description:)`` underlying error.
    /// - Parameters:
    ///   - type: The type that does not contain the correct content. Usually due to a syntax error but has resulted in the compiler being unable to continue.
    ///   - description: The description of why the type has invalid content.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func invalidContent(type: String, description: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidContent(type: type, description: description), level: .error, recoveryStrategy: "Make sure the content for the node \(type) contains the correct syntax")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/generic`` underlying error. Used for submitting generic errors that do not require their own underlying error type.
    /// - Parameters:
    ///   - description: The description of the generic error.
    ///   - recoveryStrategy: A strategy to recover from the given error.
    ///   - level: The level of severity of the error.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func generic(description: String, recoveryStrategy: String, level: Level) -> JellycoreError {
        return JellycoreError(underlyingError: .generic, level: level, description: description, recoveryStrategy: recoveryStrategy)
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/missingParameterName(function:name:)`` underlying error.
    /// - Parameters:
    ///   - function: The function that is missing a parameter.
    ///   - name: The name of the parameter that is missing.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func missingParameterName(function: String, name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .missingParameterName(function: function, name: name), level: .error, recoveryStrategy: "Jelly no longer supports unnamed parameters. You need to include the parameter name - (\(name):) in the function: (\(function))")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/missingParameter(function:name:)`` underlying error.
    /// - Parameters:
    ///   - function: The function that is missing a parameter.
    ///   - name: The name of the parameter that is missing.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func missingParameter(function: String, name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .missingParameter(function: function, name: name), level: .warning, recoveryStrategy: "Make sure that you have included all of the parameters you wish in the function \(function)")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/variableDoesNotExist(variable:)`` underlying error.
    /// - Parameter variable: The name of the variable that does not exist.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func variableDoesNotExist(variable: String) -> JellycoreError {
        return JellycoreError(underlyingError: .variableDoesNotExist(variable: variable), level: .error, recoveryStrategy: "Make sure that you have initialized the variable \(variable)")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/invalidTypeCoercion(type:)`` underlying error.
    /// - Parameter type: The type that was not valid for Type Coercion
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func invalidTypeCoercion(type: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidTypeCoercion(type: type), level: .error, recoveryStrategy: "Make sure you have entered a valid type coercion value for the as property.")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/generic`` but inserts it at the syntax level of severity.
    /// - Parameters:
    ///   - description: The description of the syntax error.
    ///   - recoveryStrategy: A recovery strategy to fix the error.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func syntax(description: String, recoveryStrategy: String) -> JellycoreError {
        return JellycoreError(underlyingError: .generic, level: .syntax, description: description, recoveryStrategy: recoveryStrategy)
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/unableToParseJSON(jsonError:)`` underlying error.
    /// - Parameter error: The Swift `Error` that was reported by the JSON parser.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func unableToParseJSON(error: Error) -> JellycoreError {
        return JellycoreError(underlyingError: .unableToParseJSON(jsonError: error), level: .error, recoveryStrategy: "Check your JSON Structure for invalid syntax")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/unableToEncode(identifier:)`` underlying error.
    /// - Parameter identifier: The identifier of the action or process that was unable to be encoded.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func unableToEncode(identifier: String) -> JellycoreError {
        return JellycoreError(underlyingError: .unableToEncode(identifier: identifier), level: .error, recoveryStrategy: "Ensure that all the characters in your Jelly file are valid Unicode characters.")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/invalidFunctionRedeclaration(name:)`` underlying error.
    /// - Parameter name: The name of the function that was declared twice
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func invalidFunctionRedeclaration(name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidFunctionRedeclaration(name: name), level: .error, recoveryStrategy: "Rename one of the functions with the name \(name).")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/invalidFunctionRedeclaration(name:)`` underlying error.
    /// - Parameter name: The name of the function that was declared twice
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func invalidMacroRedeclaration(name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidMacroRedeclaration(name: name), level: .error, recoveryStrategy: "Rename one of the macro with the name \(name).")
    }
    
    /// A Jellycore error that represents the ``JellycoreUnderlyingError/undefinedFunction(name:)`` underlying error.
    /// - Parameter name: The name of the function or macro that was not found.
    /// - Returns: A JellycoreError that has been completed based on the type of error.
    static func undefinedFunction(name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .undefinedFunction(name: name), level: .error, recoveryStrategy: "Please define a function or macro named (\(name)) yourself, or import the necessary library.")
    }
}
