//
//  JellyBoolean.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct JellyBoolean: JellyPrimitiveType {
    typealias T = Bool
    
    var value: Bool
    var variable: JellyVariableReference?
    
    init(_ value: Bool) {
        self.value = value
    }
    
    init(_ value: String) throws {
        self.value = try JellyBoolean.bool(input: value)
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            self.init(false)
            // TODO: Re-setup variable references
//            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
//            if variable?.unableToInitialize ?? false {
//                return nil
//            }
        }
    }

    internal static func bool(input: String) throws -> Bool {
        let input = input.lowercased()
        if input == "off" || input == "false" || input == "0" {
            return false
        } else if input == "on" || input == "true" || input == "1" {
            return true
        } else {
            throw JellycoreError.typeError(type: "Boolean", description: "Unable to convert \(input) to boolean.")
        }
    }
}
