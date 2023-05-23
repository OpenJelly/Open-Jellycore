//
//  JellyIntegerBoolean.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct JellyIntegerBoolean: JellyPrimitiveType {
    typealias T = Int
    
    var value: Int
    var variable: JellyVariableReference?

    init(_ value: Int) {
        self.value = value
    }
    
    init(_ value: String) throws {
        let bool = try JellyBoolean.bool(input: value)
        self.value = bool ? 1 : 0
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            self.init(0)
            // TODO: Re-setup variable references
//            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
//            if variable?.unableToInitialize ?? false {
//                ErrorReporter.shared.report(error: .typeError(type: "Boolean", description: "\(value.content) is not convertable to a boolean"), textPosition: value.textPosition)
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
            throw JellycoreError.typeError(type: "Boolean", description: "Unnable to convert \(input) to boolean.")
        }
    }
}
