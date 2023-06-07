//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var JellycutsFunctions: [String : AnyAction] = [
  "importObjects": Action<ImportObjectsParameter>(name: "Import Objects", identifier: "com.zlineman.Jellyfish.ImportObjectsIntent", correctTypedFunction: "importObjects", description: """
                                Imports all of the shortcuts objects in the given shortcut into Jellycuts.
                                """, lowestCompatibleHost: .iOS13, presets: [
                                    
                                ]),
  "importShortcut": Action<ImportShortcutParameter>(name: "Import Shortcut", identifier: "com.zlineman.Jellyfish.ImportShortcutIntent", correctTypedFunction: "importShortcut", description: """
                                Import a shortcut into Jellycuts.
                                """, lowestCompatibleHost: .iOS13, presets: [
                                    
                                ]),
  "grabJellycut": Action<GrabJellycutParameter>(name: "Grab Jellycut", identifier: "com.zlineman.Jellyfish.GrabJellycutIntent", correctTypedFunction: "grabJellycut", description: """
                                Get's the plist from the latest exported Jellycut.
                                """, lowestCompatibleHost: .iOS13, presets: [
                                    
                                ]),

    ]
}