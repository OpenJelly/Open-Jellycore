//
//  LookupTables.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct TranspilerLookupTables {
    enum Library: String, CaseIterable {
        case shortcuts = "Shortcuts"
        //        case dataJar = "DataJar"
        //        case carrot = "CARROT"
        //        case apollo = "Apollo"
        //        case ashell = "AShell"
        //        case scriptable = "Scriptable"
        //        case rubyist = "Rubyist"
        //        case nudget = "Nudget"
        //        case recurrence = "Recurrence"
        //        case jellycuts = "Jellycuts"
        //        case wallpaperApp = "WallpaperApp"
        //        case otterrss = "OtterRSS"
        //        case progress = "Progress"
        //        case gizmopack = "GizmoPack"
        //        case linkbin = "LinkBin"
        //        case ashellmini = "AShellMini"
        //        case focusedWork = "FocusedWork"
        //        case drafts = "Drafts"
        //        case widgetPack = "WidgetPack"
        //        case actions = "Actions"

        var functionTable: [String : AnyAction] {
            switch self {
            case .shortcuts:
                return shortcutsFunctions
            }
        }
        
        var prettyName: String {
            rawValue
        }
        
        var description: String {
            switch self {
            case .shortcuts:
                return "The default shortcuts library that contains actions available in the Shortcuts App."
            }
        }
    }
    
    static func generateLookupTable(importedLibraries: [Library]) -> [String: AnyAction] {
        var customLookupTable: [String: AnyAction] = [:]
        
        Library.allCases.forEach({
            customLookupTable.merge($0.functionTable) { _, new in
                return new
            }
        })
        
        return customLookupTable
    }
}
