//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var DataJarFunctions: [String : AnyAction] = [
  "getTypeOfValue": Action<GetTypeOfValueParameter>(name: "Get Type of Value", identifier: "dk.simonbs.DataJar.GetTypeOfValueIntent", correctTypedFunction: "getTypeOfValue", description: """
                                Returns the type of value at the specified key path. Possible returned values are "Text", "Number", "Boolean", "File", "List" and "Dictionary".
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "checkIfValueExists": Action<CheckIfValueExistsParameter>(name: "Check If Value Exists", identifier: "dk.simonbs.DataJar.CheckIfValueExistsIntent", correctTypedFunction: "checkIfValueExists", description: """
                                Checks if a value exists at the specified key path. The returned value is a boolean represented as 1 for true and 0 for false.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getValue": Action<GetValueParameter>(name: "Get Value", identifier: "dk.simonbs.DataJar.GetValueIntent", correctTypedFunction: "getValue", description: """
                                Gets value at the specified key path. Lists and dictionaries are returned as JSON.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "viewValue": Action<ViewValueParameter>(name: "View Value", identifier: "dk.simonbs.DataJar.ViewValueIntent", correctTypedFunction: "viewValue", description: """
                                Opens Data Jar at the specified key path. When passing the key path of a text, number or boolean, the containing value will be opened.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getKeys": Action<GetKeysParameter>(name: "Get Keys", identifier: "dk.simonbs.DataJar.GetKeysIntent", correctTypedFunction: "getKeys", description: """
                                Gets keys in the dictionary at the specified key path or get all keys at the top level of the store.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deleteValue": Action<DeleteValueParameter>(name: "Delete Value", identifier: "dk.simonbs.DataJar.DeleteValueIntent", correctTypedFunction: "deleteValue", description: """
                                Deletes the value at the specified key path from the store. The action will delete the value without warning. 
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getChildCount": Action<GetChildCountParameter>(name: "Count Values", identifier: "dk.simonbs.DataJar.GetChildCountIntent", correctTypedFunction: "getChildCount", description: """
                                Outputs the number of values in a list or dictionary.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setValue": Action<DataJar_SetValueParameter>(name: "Set Value", identifier: "dk.simonbs.DataJar.SetValueIntent", correctTypedFunction: "setValue", description: """
                                Inserts or updates the value at the specified key path. The value can be a text, number, list, dictionary or a file. By default the action does not allow overwriting lists and dictionaries. This can be configured in the action. When storing a file, the "Filename" parameter can be used o specify the name of the file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "insertValueInArray": Action<InsertValueInArrayParameter>(name: "Add To List", identifier: "dk.simonbs.DataJar.InsertValueInArrayIntent", correctTypedFunction: "insertValueInArray", description: """
                                Inserts a value into the list at the specified key path.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
