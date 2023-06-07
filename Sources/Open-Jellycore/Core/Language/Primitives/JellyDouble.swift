//
//  JellyDouble.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// A type that represents a basic Double value.
struct JellyDouble: JellyPrimitiveType {
    typealias T = Double
    
    /// The value for a ``JellyDouble`` which is just a Swift double.
    var value: Double
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyDouble/value``.
    var variable: JellyVariableReference?

    /// The default initializer for a ``JellyDouble`` which creates itself using a double value..
    /// - Parameter value: A double value to be used to initialize.
    init(_ value: Double) {
        self.value = value
    }
    
    /// An initializer that attempts to convert a string into a double value.
    /// If this is unsuccessful, the function will throw an error.
    /// - Parameter value: The string value to attempt to convert to ``JellyDouble/T``.
    init(_ value: String) throws {
        guard let double = Double(value) else {
            let error = JellycoreError.typeError(type: "Double", description: "Unable to convert \(value) to Double")
            throw error
        }
        self.value = double
    }
    
    /// This initializer creates a ``JellyDouble`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyDouble``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyDouble``.
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            self.init(0.0)

            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
            if variable == nil {
                return nil
            }
        }
    }
}
