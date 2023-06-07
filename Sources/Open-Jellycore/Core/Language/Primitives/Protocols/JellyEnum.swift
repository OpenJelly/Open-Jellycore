//
//  JellyEnum.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 11/7/22.
//

/// A protocol that allows a type to be declared as a Enum.
/// Any properties that are needed by all Enums are declared on this protocol.
protocol JellyEnum: JellyAny, Codable {
    
    /// The default initializer for a JellyEnum type.
    /// This initializer internally looks like this for all of the auto generated Enums included in the Lookup Tables.
    /// ```
    /// init?(_ value: CoreNode, scopedVariables: [Variable]) {
    ///     self.init(rawValue: value.content)
    /// }
    /// ```
    /// - Parameters:
    ///   - value: The ``CoreNode`` value to initialize the enumeration with.
    ///   - scopedVariables: The scope variables that are relevant to the enumeration.
    init?(_ value: CoreNode, scopedVariables: [Variable])
    
    /// The Shortcuts value of an enumeration. This value is the `String` value that is expected from Shortcuts when an enum is encoded.
    var value: String { get }
}

