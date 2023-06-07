//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var aShellMiniFunctions: [String : AnyAction] = [
  "getFile": Action<aShellMini_GetFileParameter>(name: "Get file", identifier: "AsheKube.app.a-Shell-mini.GetFileIntent", correctTypedFunction: "getFile", description: """
                                Get file from a-Shell
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "executeCommand": Action<aShellMini_ExecuteCommandParameter>(name: "Execute Command", identifier: "AsheKube.app.a-Shell-mini.ExecuteCommandIntent", correctTypedFunction: "executeCommand", description: """
                                Run the following command in a-Shell
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "putFile": Action<aShellMini_PutFileParameter>(name: "Put File", identifier: "AsheKube.app.a-Shell-mini.PutFileIntent", correctTypedFunction: "putFile", description: """
                                Copy file to a-Shell
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
