//
//  ParameterProtocol.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 11/4/22.
//

/// A protocol that all Action parameters conforms too. Allows for generalization of the parameter classes.
protocol ParameterProtocol: Codable {
    /// A state function that allows for you to build the given class off of only it's type. This allows for generalized actions to build their own parameters and return an instance of themselves. This allows for a high level of generalization between parameters.
    /// - Parameters:
    ///   - call: The list of `FunctionCallParameterItem`s that was used when the function was called by the user.
    ///   - scopedVariables: The scope of variables available to the function
    /// - Returns: An instance of the class that conforms to ParameterProtocol with it's internal values filled out.
    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol
    
    /// Returns the default value for a Parameter. Used for filling out documentation
    /// - Returns: The list of default values keyed by the slot name for the value.
    static func getDefaultValues() -> [String: String]
}
