//
//  JellyBoolean.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// This type is just a basic Boolean value. It takes either a `Bool` or `String` as input. If it takes a `String` it will attempt to create a boolean based off of the `String` content.
/// The `String` values that can be converted into a `Bool`
/// True Values - off, false, 0
/// False Values - on, true, 1
struct JellyBoolean: JellyPrimitiveType {
    typealias T = Bool
    
    /// The value for a ``JellyBoolean`` which is just a Swift boolean.
    var value: Bool
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyBoolean/value``.
    var variable: JellyVariableReference?
    
    /// The default initializer for a ``JellyBoolean`` which creates itself using a boolean value.
    /// - Parameter value: A boolean to be used to initialize.
    init(_ value: Bool) {
        self.value = value
    }
    
    /// An initializer that attempts to convert a string into a boolean.
    /// If this is unsuccessful, the function will throw an error.
    /// - Parameter value: The string value to attempt to convert to ``JellyBoolean/T``.
    init(_ value: String) throws {
        self.value = try JellyBoolean.bool(input: value)
    }
    
    /// This initializer creates a ``JellyBoolean`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyBoolean``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyBoolean``.
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            if let parameterValue = value as? FunctionCallParameterItem,
               let parameterItem = parameterValue.item {
                try self.init(parameterItem.content)
            } else {
                try self.init(value.content)
            }
        } catch {
            self.init(false)

            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
            if variable == nil {
                return nil
            }
        }
    }
    
    /// A function that takes in a string value and attempts to convert it into a boolean.
    /// If the string is not in any valid string description of a boolean, the function throws.
    /// - Parameter input: The string to attempt to convert into a boolean.
    /// - Returns: The boolean that the input parameter represents.
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
