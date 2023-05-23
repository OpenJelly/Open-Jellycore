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
    }
    
    static func generateLookupTable(importedLibraries: [Library]) -> [String: AnyAction] {
        var customLookupTable: [String: AnyAction] = [:]
        
        for library in importedLibraries {
            switch library {
            case .shortcuts:
                customLookupTable.merge(shortcutsFunctions) { _, new in
                    return new
                }
//            case .dataJar:
//                customLookupTable.merge(dataJarFunctions) { _, new in
//                    return new
//                }
//            case .carrot:
//                customLookupTable.merge(CARROTFunctions) { _, new in
//                    return new
//                }
//            case .apollo:
//                customLookupTable.merge(ApolloFunctions) { _, new in
//                    return new
//                }
//            case .ashell:
//                customLookupTable.merge(aShellFunctions) { _, new in
//                    return new
//                }
//            case .scriptable:
//                customLookupTable.merge(ScriptableFunctions) { _, new in
//                    return new
//                }
//            case .rubyist:
//                customLookupTable.merge(RubyistFunctions) { _, new in
//                    return new
//                }
//            case .nudget:
//                customLookupTable.merge(NudgetFunctions) { _, new in
//                    return new
//                }
//            case .recurrence:
//                customLookupTable.merge(RecurrenceFunctions) { _, new in
//                    return new
//                }
//            case .jellycuts:
//                customLookupTable.merge(JellycutsFunctions) { _, new in
//                    return new
//                }
//            case .wallpaperApp:
//                customLookupTable.merge(WallpaperAppFunctions) { _, new in
//                    return new
//                }
//            case .otterrss:
//                customLookupTable.merge(OtterRSSFunctions) { _, new in
//                    return new
//                }
//            case .progress:
//                customLookupTable.merge(ProgressFunctions) { _, new in
//                    return new
//                }
//            case .gizmopack:
//                customLookupTable.merge(GizmoPackFunctions) { _, new in
//                    return new
//                }
//            case .linkbin:
//                customLookupTable.merge(LinkBinFunctions) { _, new in
//                    return new
//                }
//            case .ashellmini:
//                customLookupTable.merge(aShellMiniFunctions) { _, new in
//                    return new
//                }
//            case .focusedWork:
//                customLookupTable.merge(FocusedWorkFunctions) { _, new in
//                    return new
//                }
//            case .drafts:
//                customLookupTable.merge(DraftsFunctions) { _, new in
//                    return new
//                }
//            case .widgetPack:
//                customLookupTable.merge(WidgetPackFunctions) { _, new in
//                    return new
//                }
//            case .actions:
//                customLookupTable.merge(ActionsFunctions) { _, new in
//                    return new
//                }
            }
        }
        
        return customLookupTable
    }
}
