//
//  Scope.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/2/23.
//

/// A model that represents the scope of a block of Jelly code.
public class Scope {
    var variables: [Variable]
    var functions: [FunctionDefinitionNode]
    var fileName: String
    
    /// A generic initializer used for initially creating a scope
    init() {
        self.variables = []
        self.functions = []
        self.fileName = ""
    }
    
    init(fileName: String) {
        self.variables = []
        self.functions = []
        self.fileName = fileName
    }
    
    /// Allows you to initialize a scope using a set of variables and functions
    /// - Parameters:
    ///   - variables: the variables to include in the scope
    ///   - functions: the functions to include in the scope
    ///   - fileName: the name of the Jelly file.
    init(variables: [Variable], functions: [FunctionDefinitionNode], fileName: String) {
        self.variables = variables
        self.functions = functions
        self.fileName = fileName
    }
    
    /// Allows you to initialize a scope based on another scope. Useful for initializing scopes for inner blocks.
    /// - Parameter parentScope: the scope to initialize off of
    init(parentScope: Scope) {
        self.variables = parentScope.variables
        self.functions = parentScope.functions
        self.fileName = parentScope.fileName
    }
}
