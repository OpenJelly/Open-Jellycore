//
//  JellycoreError.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

class JellycoreError: LocalizedError, Identifiable {    
    var id: UUID = UUID()
    
    enum Level {
        case syntax
        case warning
        case error
        case fatal
    }

    enum JellycoreUnderlyingError: CustomStringConvertible {
        case unableToGetCString
        case noParserTree
        case invalidTreeSitterType(type: String)
        case typeError(type: String, description: String)
        case invalidRoot
        case invalidContent(type: String, description: String)
        case missingParameterName(function: String, name: String)
        case missingParameter(function: String, name: String)
        case variableDoesNotExist(variable: String)
        case invalidTypeCoercion(type: String)
        case unableToParseJSON(jsonError: Error)
        case unableToEncode(identifier: String)
        case generic
        
        var description: String {
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
                return "Invalid JSON, underlying error \(jsonError.localizedDescription)."
            case .unableToEncode(let identifier):
                return "Unable to encode \(identifier)."
            }
        }
    }
    
    var underlyingError: JellycoreUnderlyingError
    var relevantNode: CoreNode? = nil
    var level: JellycoreError.Level
    
    var recoveryStrategy: String
    
    var recoverySuggestion: String? {
        return recoveryStrategy
    }
    
    var errorDescription: String? {
        return description
    }
    
    var description: String
    
    init(underlyingError: JellycoreUnderlyingError, relevantNode: CoreNode? = nil, level: JellycoreError.Level, recoveryStrategy: String) {
        self.underlyingError = underlyingError
        self.relevantNode = relevantNode
        self.level = level
        self.recoveryStrategy = recoveryStrategy
        self.description = underlyingError.description
    }
    
    init(underlyingError: JellycoreUnderlyingError, relevantNode: CoreNode? = nil, level: JellycoreError.Level, description: String, recoveryStrategy: String) {
        self.underlyingError = underlyingError
        self.relevantNode = relevantNode
        self.level = level
        self.recoveryStrategy = recoveryStrategy
        self.description = description
    }

}

// MARK: Static Constructors
// Basically an error factory that allows for dot initialization of errors.
extension JellycoreError {
    static func unableToGetCString() -> JellycoreError {
        return JellycoreError(underlyingError: .unableToGetCString, level: .fatal, recoveryStrategy: "Please check your document's encoding format. Ensure that it is encoded in UTF-8.")
    }
    
    static func noParserTree() -> JellycoreError {
        return JellycoreError(underlyingError: .noParserTree, level: .fatal, recoveryStrategy: "Please ensure that your document contains valid Jelly code.")
    }
    
    static func invalidTreeSitterType(type: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidTreeSitterType(type: type), level: .fatal, recoveryStrategy: "Check if CoreNodeTypes match the type present in the Jelly grammar.")
    }
    
    static func typeError(type: String, description: String) -> JellycoreError {
        return JellycoreError(underlyingError: .typeError(type: type, description: description), level: .error, recoveryStrategy: "Make sure the type is accurate for the input")
    }
    
    static func invalidRoot() -> JellycoreError {
        return JellycoreError(underlyingError: .invalidRoot, level: .fatal, recoveryStrategy: "Make sure your file contain's valid Jelly code")
    }
    
    static func invalidContent(type: String, description: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidContent(type: type, description: description), level: .error, recoveryStrategy: "Make sure the content for the node \(type) contains the correct syntax")
    }
    
    static func generic(description: String, recoveryStrategy: String, level: Level) -> JellycoreError {
        return JellycoreError(underlyingError: .generic, level: level, description: description, recoveryStrategy: recoveryStrategy)
    }
    
    static func missingParameterName(function: String, name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .missingParameterName(function: function, name: name), level: .error, recoveryStrategy: "Jelly no longer supports unnamed parameters. You need to include the parameter name - (\(name):) in the function: (\(function))")
    }
    
    static func missingParameter(function: String, name: String) -> JellycoreError {
        return JellycoreError(underlyingError: .missingParameter(function: function, name: name), level: .warning, recoveryStrategy: "Make sure that you have included all of the parameters you wish in the function \(function)")
    }
    
    static func variableDoesNotExist(variable: String) -> JellycoreError {
        return JellycoreError(underlyingError: .variableDoesNotExist(variable: variable), level: .error, recoveryStrategy: "Make sure that you have initialized the variable \(variable)")
    }
    
    static func invalidTypeCoercion(type: String) -> JellycoreError {
        return JellycoreError(underlyingError: .invalidTypeCoercion(type: type), level: .error, recoveryStrategy: "Make sure you have entered a valid type coercion value for the as property.")
    }
    
    static func syntax(description: String, recoveryStrategy: String) -> JellycoreError {
        return JellycoreError(underlyingError: .generic, level: .syntax, description: description, recoveryStrategy: recoveryStrategy)
    }

    static func unableToParseJSON(error: Error) -> JellycoreError {
        return JellycoreError(underlyingError: .unableToParseJSON(jsonError: error), level: .error, recoveryStrategy: "Check your JSON Structure for invalid syntax")
    }
    
    static func unableToEncode(identifier: String) -> JellycoreError {
        return JellycoreError(underlyingError: .unableToEncode(identifier: identifier), level: .error, recoveryStrategy: "Ensure that all the characters in your Jelly file are valid Unicode characters.")
    }
}
