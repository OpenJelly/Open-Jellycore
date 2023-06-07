//
//  JellyInteger.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// A type that represents a basic integer.
struct JellyInteger: JellyPrimitiveType {
    typealias T = Int
    
    /// The value for a ``JellyInteger`` which is just a Swift integer.
    var value: Int
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyInteger/value``.
    var variable: JellyVariableReference?

    /// The default initializer for a ``JellyInteger`` which creates itself using an integer value.
    /// - Parameter value: An integer  to be used to initialize.
    init(_ value: Int) {
        self.value = value
    }
    
    /// An initializer that attempts to convert a string into an integer.
    /// If this is unsuccessful, the function will throw an error.
    /// - Parameter value: The string value to attempt to convert to ``JellyInteger/T``.
    init(_ value: String) throws {
        guard let integer = Int(value) else {
            throw JellycoreError.typeError(type: "Integer", description: "Unable to convert \(value) to integer")
        }
        self.value = integer
    }
    
    /// This initializer creates a ``JellyInteger`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyInteger``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyInteger``.
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            self.init(0)

            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
            if variable == nil {
                return nil
            }
        }
    }
}
