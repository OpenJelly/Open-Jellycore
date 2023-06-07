//
//  WFAction.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// Represents a shortcut action. Named WFAction to distinguish it from the Jelly `Action` type.
public struct WFAction: Codable {
    /// The identifier for the action
    var WFWorkflowActionIdentifier: String
    /// Any parameters contained in the action.
    var WFWorkflowActionParameters: [String: QuantumValue]
}
