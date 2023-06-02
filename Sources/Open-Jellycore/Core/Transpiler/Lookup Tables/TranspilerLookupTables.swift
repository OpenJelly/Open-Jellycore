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
                return ShortcutsFunctions
//            case .dataJar:
//                return DataJarFunctions
//            case .carrot:
//                return CARROTFunctions
//            case .apollo:
//                return ApolloFunctions
//            case .ashell:
//                return aShellFunctions
//            case .scriptable:
//                return ScriptableFunctions
//            case .rubyist:
//                return RubyistFunctions
//            case .nudget:
//                return NudgetFunctions
//            case .recurrence:
//                return RecurrenceFunctions
//            case .jellycuts:
//                return JellycutsFunctions
//            case .wallpaperApp:
//                return WallpaperAppFunctions
//            case .otterrss:
//                return OtterRSSFunctions
//            case .progress:
//                return ProgressFunctions
//            case .gizmopack:
//                return GizmoPackFunctions
//            case .linkbin:
//                return LinkBinFunctions
//            case .ashellmini:
//                return aShellMiniFunctions
//            case .focusedWork:
//                return FocusedWorkFunctions
//            case .drafts:
//                return DraftsFunctions
//            case .widgetPack:
//                return WidgetPackFunctions
//            case .actions:
//                return ActionsFunctions
            }
        }
        
        var prettyName: String {
            rawValue
        }
        
        var description: String {
            switch self {
            case .shortcuts:
                return "The default shortcuts library that contains actions available in the Shortcuts App."
//            case .dataJar:
//                return ""
//            case .carrot:
//                return ""
//            case .apollo:
//                return ""
//            case .ashell:
//                return ""
//            case .scriptable:
//                return ""
//            case .rubyist:
//                return ""
//            case .nudget:
//                return ""
//            case .recurrence:
//                return ""
//            case .jellycuts:
//                return ""
//            case .wallpaperApp:
//                return ""
//            case .otterrss:
//                return ""
//            case .progress:
//                return ""
//            case .gizmopack:
//                return ""
//            case .linkbin:
//                return ""
//            case .ashellmini:
//                return ""
//            case .focusedWork:
//                return ""
//            case .drafts:
//                return ""
//            case .widgetPack:
//                return ""
//            case .actions:
//                return ""
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
