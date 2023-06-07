//
//  Scope.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/2/23.
//

/// A model that represents the scope of a block of Jelly code.
public class Scope {
    /// The variables that the user has defined in this scope.
    var variables: [Variable]
    /// The functions that the user has defined in this scope.
    var functions: [FunctionDefinitionNode]
    /// The macros that the user has defined in this scope.
    var macros: [MacroDefinitionNode]
    /// The filename of the currently compiling Jellycut,
    var fileName: String
    /// The libraries that the user has imported
    private var importedLibraries: [CompilerLookupTables.Library] = []
    /// A lookup table used to find functions by their name.
    var lookupTable: [String: AnyAction] = [:]

    /// A generic initializer used for initially creating a scope.
    init() {
        self.variables = []
        self.functions = []
        self.macros = []
        self.fileName = ""
    }
    
    /// An initializer that takes in the file name
    /// - Parameter fileName: The name of the file that is being compiled.
    init(fileName: String) {
        self.variables = []
        self.functions = []
        self.macros = []
        self.fileName = fileName
    }
    
    /// Allows you to initialize a scope based on another scope. Useful for initializing scopes for inner blocks.
    /// - Parameter parentScope: the scope to initialize based on.
    init(parentScope: Scope) {
        self.variables = parentScope.variables
        self.functions = parentScope.functions
        self.macros = parentScope.macros
        self.fileName = parentScope.fileName
        self.importedLibraries = parentScope.importedLibraries
        self.lookupTable = parentScope.lookupTable
    }
    
    func addLibrary(library: CompilerLookupTables.Library) {
        let libraryTable = library.functionTable
        
        lookupTable.merge(libraryTable) { first, _ in
            return first
        }
    }
}
