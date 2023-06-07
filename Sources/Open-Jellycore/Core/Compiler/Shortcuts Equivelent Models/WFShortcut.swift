//
//  WFShortcut.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

/// The possible workflow workflow types. These are used by shortcuts to determine where a shortcut should be shown across the system.
enum WFWorkflowTypes: String, Encodable {
    case ncWidget = "NCWidget"
}

/// A representation of all of the values found in a .shortcut plist. These values are encoded into a plist at the end of compilation.
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
    
    /// A shortcuts Icon that contains the background color and the icon to be shown.
    struct Icon: Encodable {
        var WFWorkflowIconStartColor: Int = 4282601983
        var WFWorkflowIconGlyphNumber: Int = 61440
    }
}

