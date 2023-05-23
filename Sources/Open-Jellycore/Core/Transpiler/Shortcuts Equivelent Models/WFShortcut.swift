//
//  WFShortcut.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

enum WFWorkflowTypes: String, Encodable {
    case ncWidget = "NCWidget"
}

struct WFShortcut: Encodable {
    var WFWorkflowClientVersion: String = "1050.24"
    var WFWorkflowMinimumClientVersionString: String = "900"
    var WFWorkflowMinimumClientVersion: Int = 900
    var WFWorkflowClientRelease = 3.0
    var WFWorkflowIcon: Icon = Icon()
    var WFWorkflowImportQuestions: [String] = []
    var WFWorkflowTypes: [WFWorkflowTypes] = [.ncWidget]
    var WFWorkflowInputContentItemClasses: [String] = []
    var WFWorkflowActions: [WFAction] = []
    
    struct Icon: Encodable {
        var WFWorkflowIconStartColor: Int = 4282601983
        var WFWorkflowIconGlyphNumber: Int = 61440
    }
}

