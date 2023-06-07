//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var RecurrenceFunctions: [String : AnyAction] = [
  "completeItem": Action<CompleteItemParameter>(name: "Complete Item", identifier: "com.shayesapps.recurrence.CompleteItemIntent", correctTypedFunction: "completeItem", description: """
                                Completes the given item
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}