//
//  JellyIntegerBoolean.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// A type that represents the rarely used Shortcuts integer based boolean type. This function takes in a boolean or integer and converts it into a 0 or 1 based on the input value.,
struct JellyIntegerBoolean: JellyPrimitiveType {
    typealias T = Int
    
    /// The value for a ``JellyIntegerBoolean`` which is just a Swift integer. This value will be either 0 or 1 where 0 is false and 1 is true.
    var value: Int
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyIntegerBoolean/value``.
    var variable: JellyVariableReference?

    /// The default initializer for a ``JellyIntegerBoolean`` which creates itself using a boolean value. If the value is not either 0 or 1, it is set to 0 which is false.
    /// - Parameter value: An integer with the value of either 0 or 1
    init(_ value: Int) {
        self.value = value
        
        if !(value == 0 || value == 1) {
            self.value = 0
        }
    }
    
    /// An initializer that attempts to convert a string into an boolean which is then converted to an integer..
    /// If this is unsuccessful, the function will throw an error.
    /// - Parameter value: The string value to attempt to convert to ``JellyIntegerBoolean/T``.
    init(_ value: String) throws {
        let bool = try JellyBoolean.bool(input: value)
        self.value = bool ? 1 : 0
    }
    
    /// This initializer creates a ``JellyIntegerBoolean`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyIntegerBoolean``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyIntegerBoolean``.
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
