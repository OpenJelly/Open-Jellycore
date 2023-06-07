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
    
    /// Adds a shortcut app library into the lookup table scope.
    /// - Parameter library: the ``CompilerLookupTables/Library`` to add to the scope.
    func addLibrary(library: CompilerLookupTables.Library) {
        let libraryTable = library.functionTable
        
        lookupTable.merge(libraryTable) { first, _ in
            return first
        }
    }
    
    /// Creates variables that are present within repeat statements. Supports different nested depths of repeat statements,
    func createRepeatNumberVariables() {
        var repeatDepth = 0
        for variable in variables {
            if variable.name.starts(with: "RepeatIndex") {
                repeatDepth += 1
            }
        }
        
        print(repeatDepth)
        if repeatDepth == 0 {
            let name = "RepeatIndex"
            variables.append(Variable(uuid: name, name: name, valueType: .global, value: nil))
        } else {
            let name = "RepeatIndex\(repeatDepth)"
            variables.append(Variable(uuid: name, name: name, valueType: .global, value: nil))
        }
    }
    
    /// Creates variables that are present within repeat each statements. Supports different nested depths of repeat each statements,
    func createRepeatEachVariables() {
        var repeatDepth = 0
        for variable in variables {
            if variable.name.starts(with: "RepeatIndex") {
                repeatDepth += 1
            }
        }
        
        if repeatDepth == 0 {
            let indexName = "RepeatIndex"
            let itemName = "RepeatItem"

            variables.append(Variable(uuid: indexName, name: indexName, valueType: .global, value: nil))
            variables.append(Variable(uuid: itemName, name: itemName, valueType: .global, value: nil))
        } else {
            let indexName = "RepeatIndex\(repeatDepth)"
            let itemName = "RepeatItem\(repeatDepth)"

            variables.append(Variable(uuid: indexName, name: indexName, valueType: .global, value: nil))
            variables.append(Variable(uuid: itemName, name: itemName, valueType: .global, value: nil))
        }
    }
}
