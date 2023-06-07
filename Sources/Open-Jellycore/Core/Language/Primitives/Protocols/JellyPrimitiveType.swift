//
//  JellyPrimitiveType.swift
//  
//
//  Created by Taylor Lineman on 10/27/22.
//

/// This protocol is used to declare any of the primitive Jelly types.
/// It declares all of the necessary properties for a primitive type to function and encode itself.
protocol JellyPrimitiveType: JellyAny, Codable {
    /// Primitive Types need an associated type that is Codable.
    associatedtype T: Codable
    /// The raw value of the Jelly Primitive
    var value: T { get set }
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyPrimitiveType/value``.
    var variable: JellyVariableReference? { get set }
    
    /// The default initializer for a Primitive Type that takes in the ``JellyPrimitiveType/T``.
    /// - Parameter value: The default value to be used for initialization.
    init(_ value: T)
    
    /// An initializer that attempts to convert a string into the raw value for the primitive type. If this is unsuccessful, the function will throw an error.
    /// - Parameter value: The string value to attempt to convert to ``JellyPrimitiveType/T``.
    init(_ value: String) throws
    
    /// This initializer creates a ``JellyPrimitiveType`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(_ value: CoreNode, scopedVariables: [Variable])
            
    /// This initializer creates a ``JellyPrimitiveType`` type taking in a ``FunctionCallParameterItem`` and the scope's variables
    /// This function has a default implementation that converts the ``FunctionCallParameterItem`` to a ``CorePrimitiveNode`` by grabbing ``FunctionCallParameterItem/item``  and passes it into the ``JellyPrimitiveType/init(_:scopedVariables:)`` initializer.
    /// - Parameters:
    ///   - value: the function call parameter item node  to convert to the Jelly type.
    ///   - scopedVariables: the variables that are in the scope of this Jelly type.
    init?(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable])

}

extension JellyPrimitiveType {
    /// Encodes the ``JellyPrimitiveType`` to the given `encoder`.
    /// - Parameter encoder: the encoder to encode into.
    func encode(to encoder: Encoder) throws {
        if let variable {
            try variable.encode(to: encoder)
        } else {
            var container = encoder.singleValueContainer()
            try container.encode(value)
        }
    }
}
