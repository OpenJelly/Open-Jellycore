//
//  WFAction.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct WFAction: Codable {
    var WFWorkflowActionIdentifier: String
    var WFWorkflowActionParameters: [String: QuantumValue]
}
