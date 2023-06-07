//
//  JellyObject.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 1/6/23.
//

/// A protocol that allows a type to be declared as a Jelly Object.
protocol JellyObject: JellyAny, Codable {
    
    /// The default initializer for a ``JellyObject``, unlike ``JellyEnum`` this does not have a default initializer that is present in all ``JellyObject``s. Each ``JellyObject`` has it's own custom initializer.
    /// - Parameters:
    ///   - value: The ``CoreNode`` value to initialize the Object with.
    ///   - scopedVariables: The scoped variables that are relevant to initialization of the object.
    init?(_ value: CoreNode, scopedVariables: [Variable])
    
    /// The name of the Jelly object. Used for documentation purposes.
    var objectName: String { get }
    /// The correct typed object that the user can enter in code to call the object initialization.
    var correctType: String { get }
    /// The description of the object that is shown in documentation to explain the object.
    var description: String { get }
}

