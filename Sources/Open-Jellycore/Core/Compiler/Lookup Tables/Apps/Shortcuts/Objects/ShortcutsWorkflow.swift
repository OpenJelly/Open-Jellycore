//
//  ShortcutsWorkflow.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

struct ShortcutsWorkflow: JellyAny, Codable {
    var isSelf: Bool = false
    var workflowIdentifier: String = ""
    var workflowName: String = ""
    
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        self.workflowName = value.content
    }
    
}
