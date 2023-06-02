//
//  Scope.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/2/23.
//

class Scope {
    var variables: [Variable] = []
    var functions: [FunctionDefinitionNode] = []

    init() {
        
    }

    init(variables: [Variable], functions: [FunctionDefinitionNode]) {
        self.variables = variables
        self.functions = functions
    }
    
    init(parentScope: Scope) {
        self.variables = parentScope.variables
        self.functions = parentScope.functions
    }
}
