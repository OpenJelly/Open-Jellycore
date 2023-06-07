//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var aShellFunctions: [String : AnyAction] = [
  "putFile": Action<aShell_PutFileParameter>(name: "Put File", identifier: "AsheKube.app.a-Shell.PutFileIntent", correctTypedFunction: "putFile", description: """
                                Copy file to a-Shell
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFile": Action<aShell_GetFileParameter>(name: "Get file", identifier: "AsheKube.app.a-Shell.GetFileIntent", correctTypedFunction: "getFile", description: """
                                Get file from a-Shell
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "executeCommand": Action<aShell_ExecuteCommandParameter>(name: "Execute Command", identifier: "AsheKube.app.a-Shell.ExecuteCommandIntent", correctTypedFunction: "executeCommand", description: """
                                Run the following command in a-Shell
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
