//
//  LookupTables.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

/// A structure that handles creating lookup tables based on the available libraries
struct TranspilerLookupTables {
    /// All of the available Jelly libraries
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

        /// The function table provided by the individual library
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
        
        /// The pretty printed name of the library. Used for display and documentation
        var prettyName: String {
            rawValue
        }
        
        /// The description of the library. Used for display and documentation.
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
    
    
    /// Generates a lookup table that includes all of the functions from the provided libraries
    /// - Parameter importedLibraries: The libraries whose functions should be included in the resulting lookup table.
    /// - Returns: A dictionary keyed by function name with the action as the value.
    static func generateLookupTable(importedLibraries: [Library]) -> [String: AnyAction] {
        var customLookupTable: [String: AnyAction] = [:]
        
        importedLibraries.forEach({
            customLookupTable.merge($0.functionTable) { _, new in
                return new
            }
        })
        
        return customLookupTable
    }
}
