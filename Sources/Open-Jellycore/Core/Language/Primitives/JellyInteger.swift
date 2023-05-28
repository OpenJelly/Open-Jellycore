//
//  JellyInteger.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct JellyInteger: JellyPrimitiveType {
    typealias T = Int
    
    var value: Int
    var variable: JellyVariableReference?

    init(_ value: Int) {
        self.value = value
    }
    
    init(_ value: String) throws {
        guard let integer = Int(value) else {
            throw JellycoreError.typeError(type: "Integer", description: "Unable to convert \(value) to integer")
        }
        self.value = integer
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            self.init(0)
            // TODO: Re-setup variable references
            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
            if variable?.unableToInitialize ?? false {
                return nil
            }
        }
    }
}
