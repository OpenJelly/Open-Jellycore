//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var ScriptableFunctions: [String : AnyAction] = [
  "runScriptInline": Action<RunScriptInlineParameter>(name: "Run Inline Script", identifier: "dk.simonbs.Scriptable.RunScriptInlineIntent", correctTypedFunction: "runScriptInline", description: """
                                Runs a script in Scriptable. The parameter can be accessed using args.shortcutParameter. This parameter can be a text, list, dictionary or a file. When passing a file as input the action will attempt to read the file as JSON or a plain text. If the file cannot be read as JSON or plain text, a path to the file will be passed instead. Use args.plainTexts, args.images, args.urls and args.fileURLs to read the other input parameters. When passing large images and files as input, the script may fail due to memory constraints. In that case you should enable "Run In App". Use JavaScript's "return" keyword or Script.setShortcutOutput() to output a value. In case you don't output a value, add Script.complete() to indicate that your script have finished running.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "parameterizedRunScript": Action<ParameterizedRunScriptParameter>(name: "Run Script", identifier: "dk.simonbs.Scriptable.ParameterizedRunScriptIntent", correctTypedFunction: "parameterizedRunScript", description: """
                                Runs a script in Scriptable. The parameter can be accessed using args.shortcutParameter. This parameter can be a text, list, dictionary or a file. When passing a file as input the action will attempt to read the file as JSON or a plain text. If the file cannot be read as JSON or plain text, a path to the file will be passed instead. Use args.plainTexts, args.images, args.urls and args.fileURLs to read the other input parameters. When passing large images and files as input, the script may fail due to memory constraints. In that case you should enable "Run In App". Use JavaScript's "return" keyword or Script.setShortcutOutput() to output a value. In case you don't output a value, add Script.complete() to indicate that your script have finished running.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "refreshAllWidgets": Action<RefreshAllWidgetsParameter>(name: "Refresh All Widgets", identifier: "dk.simonbs.Scriptable.RefreshAllWidgetsIntent", correctTypedFunction: "refreshAllWidgets", description: """
                                Refreshes all widgets, causing the scripts to run again and provide an updated widget.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createFileBookmark": Action<CreateFileBookmarkParameter>(name: "Create File Bookmark", identifier: "dk.simonbs.Scriptable.CreateFileBookmarkIntent", correctTypedFunction: "createFileBookmark", description: """
                                Creates a new file bookmark. The bookmark can be used to access files in your scripts using FileManagers bookmarkedPath(name) function. Please beware that bookmarks must be created using this action in order to be used in scripts running in the Shortcuts app.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}