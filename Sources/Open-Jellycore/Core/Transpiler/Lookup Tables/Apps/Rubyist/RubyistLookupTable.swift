//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var RubyistFunctions: [String : AnyAction] = [
  "runCode": Action<RunCodeParameter>(name: "Run Ruby Code", identifier: "sebastian.szturo.Rubyist.RunCodeIntent", correctTypedFunction: "runCode", description: """
                                Runs specified Ruby Code
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "runFile": Action<RunFileParameter>(name: "Run Ruby File", identifier: "sebastian.szturo.Rubyist.RunFileIntent", correctTypedFunction: "runFile", description: """
                                Runs specified Ruby File
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}